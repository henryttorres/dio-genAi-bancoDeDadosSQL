"""Adaptador generico. Ajuste FIELD_MAP e o formato de payload conforme a API interna."""
import os, json, logging
from pathlib import Path
import requests, pandas as pd
from app import normalize
logging.basicConfig(level=logging.INFO,format='%(asctime)s %(levelname)s %(message)s')
BASE=Path(__file__).resolve().parent
API_URL=os.environ['CONTROL_API_URL']; TOKEN=os.environ['CONTROL_API_TOKEN']
headers={'Authorization':f'Bearer {TOKEN}','Accept':'application/json'}
r=requests.get(API_URL,headers=headers,timeout=30); r.raise_for_status()
payload=r.json(); records=payload.get('data',payload) if isinstance(payload,dict) else payload
if not isinstance(records,list): raise ValueError('A API deve retornar uma lista ou um objeto com a chave data.')
df=normalize(pd.DataFrame(records)); out=BASE/'data'/'base_grafana.csv'; df.to_csv(out,index=False)
logging.info('%s registros gravados em %s',len(df),out)
