# Automacao Rodar em Loja

Protótipo local para importar CSV, consolidar indicadores, aplicar regras de elegibilidade e preparar a base do Google Sheets/Grafana.

## Executar no Windows
1. Extraia a pasta.
2. Dê dois cliques em `run_local.bat`.
3. Abra `http://127.0.0.1:5000`.

## Executar no macOS/Linux
```bash
./run_local.sh
```

## Entrada CSV
Use `data/exemplo_entrada.csv` como modelo. Colunas principais:
`data,hora,praca,loja,operacao,inicio_turno,fim_turno,vagas_solicitadas,vagas_reservadas,vagas_livres`.

## Sincronizar Google Sheets
1. Crie um projeto no Google Cloud e ative a Google Sheets API.
2. Crie uma conta de serviço e baixe o JSON para `credentials.json`.
3. Compartilhe a planilha com o `client_email` da conta de serviço como editor.
4. Defina as variáveis do `.env.example` no terminal.
5. Execute `python sync_google_sheets.py`.

## Consumir uma API interna
Defina `CONTROL_API_URL` e `CONTROL_API_TOKEN`, depois execute:
```bash
python api_ingestion.py
```
O adaptador é genérico porque o contrato real da API não foi fornecido. Ajuste o payload em `api_ingestion.py` se a resposta não for uma lista ou `{ "data": [...] }`.

## Grafana
Aponte o plugin Google Sheets para o ID da planilha e o intervalo `BASE_GRAFANA!A:R`. Para uma planilha privada, prefira autenticação JWT/conta de serviço.

## Segurança
Não versione `credentials.json`, tokens ou dados pessoais. O aplicativo local não dispara mensagens; apenas recomenda o canal. Integração de envio deve ter aprovação, auditoria e controle de acesso.
