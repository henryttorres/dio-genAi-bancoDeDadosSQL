@echo off
cd /d "%~dp0"
if not exist ".venv\Scripts\python.exe" (
 echo Ambiente ainda nao instalado. Execute INICIAR_WINDOWS.bat primeiro.
 pause
 exit /b 1
)
".venv\Scripts\python.exe" -c "import flask,pandas; print('Dependencias OK')"
".venv\Scripts\python.exe" -m py_compile app.py api_ingestion.py sync_google_sheets.py
if errorlevel 1 (echo Falha detectada.) else (echo Arquivos Python OK.)
pause
