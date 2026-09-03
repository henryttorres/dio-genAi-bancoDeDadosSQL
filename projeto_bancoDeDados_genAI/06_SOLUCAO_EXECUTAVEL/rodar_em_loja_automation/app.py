import os, io, json
from datetime import datetime
from pathlib import Path
import pandas as pd
from flask import Flask, render_template, request, jsonify, send_file
from werkzeug.utils import secure_filename

BASE = Path(__file__).resolve().parent
DATA = BASE / 'data'
DATA.mkdir(exist_ok=True)
CURRENT = DATA / 'base_grafana.csv'
app = Flask(__name__)

ALIASES = {
 'data':['data','date'], 'hora':['hora','time'], 'praca':['praca','praça','cidade'],
 'loja':['loja','store'], 'operacao':['operacao','operação','operation'],
 'inicio_turno':['inicio_turno','inicio','início_turno'], 'fim_turno':['fim_turno','fim'],
 'vagas_solicitadas':['vagas_solicitadas','planejadas','capacidade'],
 'vagas_reservadas':['vagas_reservadas','preenchidas','ocupadas'],
 'vagas_livres':['vagas_livres','livres','vagas']
}

def norm_key(x):
    import unicodedata, re
    x = unicodedata.normalize('NFD', str(x).strip().lower())
    x = ''.join(c for c in x if unicodedata.category(c) != 'Mn')
    return re.sub(r'\s+', '_', x)

def normalize(df):
    original = {norm_key(c): c for c in df.columns}
    out = pd.DataFrame()
    for target, aliases in ALIASES.items():
        found = next((original.get(norm_key(a)) for a in aliases if norm_key(a) in original), None)
        out[target] = df[found] if found else ''
    for c in ['vagas_solicitadas','vagas_reservadas','vagas_livres']:
        out[c] = pd.to_numeric(out[c].astype(str).str.replace(',','.',regex=False), errors='coerce').fillna(0)
    missing_free = out['vagas_livres'].eq(0) & out['vagas_solicitadas'].gt(0)
    out.loc[missing_free,'vagas_livres'] = (out.loc[missing_free,'vagas_solicitadas']-out.loc[missing_free,'vagas_reservadas']).clip(lower=0)
    out['taxa_ocupacao'] = (out['vagas_reservadas']/out['vagas_solicitadas'].replace(0,pd.NA)).fillna(0)
    now = pd.Timestamp.now()
    end = pd.to_datetime(out['data'].astype(str)+' '+out['fim_turno'].astype(str), errors='coerce')
    out['minutos_restantes'] = ((end-now).dt.total_seconds()/60).fillna(0).round().astype(int)
    out['elegivel'] = (out['vagas_livres']>0) & (out['minutos_restantes']>90)
    out['canal_recomendado'] = 'Nao acionar'
    totals = out[out['elegivel']].groupby(['data','praca'])['vagas_livres'].transform('sum')
    out.loc[out['elegivel'] & totals.le(2),'canal_recomendado'] = 'Blip Desk'
    out.loc[out['elegivel'] & totals.ge(3),'canal_recomendado'] = 'Blip Portal'
    out['status'] = 'Preenchido'
    out.loc[out['vagas_livres'].gt(0) & out['taxa_ocupacao'].ge(.8),'status']='Acompanhar'
    out.loc[out['vagas_livres'].gt(0) & out['taxa_ocupacao'].lt(.8),'status']='Acionar agora'
    out['ultima_atualizacao'] = datetime.now().isoformat(timespec='seconds')
    return out

def load_current():
    if not CURRENT.exists():
        sample = pd.read_csv(DATA/'exemplo_entrada.csv')
        normalize(sample).to_csv(CURRENT,index=False)
    return pd.read_csv(CURRENT)

@app.get('/')
def index(): return render_template('index.html')

@app.get('/api/data')
def data():
    df=load_current().fillna('')
    return jsonify(df.to_dict(orient='records'))

@app.post('/api/upload')
def upload():
    f=request.files.get('file')
    if not f or not f.filename.lower().endswith('.csv'):
        return jsonify(error='Envie um arquivo CSV.'),400
    try:
        raw=pd.read_csv(f,sep=None,engine='python')
        df=normalize(raw)
        df.to_csv(CURRENT,index=False)
        return jsonify(ok=True,rows=len(df))
    except Exception as e: return jsonify(error=str(e)),400

@app.post('/api/sync-sheet')
def sync_sheet():
    body=request.get_json(force=True); url=body.get('url','').strip()
    if not url: return jsonify(error='Informe a URL CSV publicada.'),400
    try:
        raw=pd.read_csv(url)
        df=normalize(raw); df.to_csv(CURRENT,index=False)
        return jsonify(ok=True,rows=len(df))
    except Exception as e: return jsonify(error=f'Falha na leitura: {e}'),400

@app.get('/api/export')
def export():
    return send_file(CURRENT,as_attachment=True,download_name='base_grafana.csv',mimetype='text/csv')

@app.get('/api/recommendation')
def recommendation():
    df=load_current(); eligible=df[df['elegivel'].astype(str).str.lower().isin(['true','1'])]
    if eligible.empty: return jsonify(status='Sem oportunidade elegivel', channel='Nao acionar', message='Nenhum turno com vagas e mais de 1h30 ate o encerramento.')
    total=float(eligible['vagas_livres'].sum()); channel='Blip Desk' if total<=2 else 'Blip Portal'
    return jsonify(status='Oportunidade identificada',channel=channel,total_vagas=total,pracas=sorted(eligible['praca'].dropna().unique().tolist()))

if __name__=='__main__':
    app.run(host=os.getenv('HOST','127.0.0.1'),port=int(os.getenv('PORT','5000')),debug=False)
