"""Envia base_grafana.csv para uma aba Google Sheets usando conta de servico."""
import os, csv
from pathlib import Path
from google.oauth2.service_account import Credentials
from googleapiclient.discovery import build

BASE=Path(__file__).resolve().parent
CSV_PATH=Path(os.getenv('CSV_PATH', BASE/'data'/'base_grafana.csv'))
SPREADSHEET_ID=os.environ['SPREADSHEET_ID']
SHEET_NAME=os.getenv('SHEET_NAME','BASE_GRAFANA')
CREDENTIALS_FILE=os.getenv('GOOGLE_APPLICATION_CREDENTIALS','credentials.json')
SCOPES=['https://www.googleapis.com/auth/spreadsheets']

creds=Credentials.from_service_account_file(CREDENTIALS_FILE,scopes=SCOPES)
service=build('sheets','v4',credentials=creds,cache_discovery=False)
with CSV_PATH.open(encoding='utf-8-sig',newline='') as f: values=list(csv.reader(f))
service.spreadsheets().values().clear(spreadsheetId=SPREADSHEET_ID,range=f'{SHEET_NAME}!A:Z',body={}).execute()
service.spreadsheets().values().update(spreadsheetId=SPREADSHEET_ID,range=f'{SHEET_NAME}!A1',valueInputOption='USER_ENTERED',body={'values':values}).execute()
print(f'{len(values)-1} registros enviados para {SHEET_NAME}.')
