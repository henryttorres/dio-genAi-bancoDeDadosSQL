@echo off
setlocal
cd /d "%~dp0"
title Rodar em Loja - Servidor Local
color 0F

echo ==========================================
echo   RODAR EM LOJA - INICIALIZACAO LOCAL
echo ==========================================
echo.

where py >nul 2>nul
if %errorlevel%==0 (
  set "PY=py -3"
) else (
  where python >nul 2>nul
  if %errorlevel% neq 0 goto :NO_PYTHON
  set "PY=python"
)

echo [1/4] Python localizado.
if not exist ".venv\Scripts\python.exe" (
  echo [2/4] Criando ambiente virtual...
  %PY% -m venv .venv
  if errorlevel 1 goto :ERROR
) else (
  echo [2/4] Ambiente virtual ja existe.
)

echo [3/4] Instalando ou atualizando dependencias...
".venv\Scripts\python.exe" -m pip install --disable-pip-version-check -r requirements.txt
if errorlevel 1 goto :ERROR

echo [4/4] Iniciando servidor em http://127.0.0.1:5000
echo.
echo NAO FECHE ESTA JANELA enquanto estiver usando o painel.
echo Para encerrar, pressione CTRL+C.
echo.
start "" powershell -NoProfile -WindowStyle Hidden -Command "Start-Sleep -Seconds 3; Start-Process 'http://127.0.0.1:5000'"
".venv\Scripts\python.exe" app.py
if errorlevel 1 goto :ERROR
goto :END

:NO_PYTHON
echo ERRO: Python nao foi encontrado neste computador.
echo Instale o Python 3.10 ou superior e marque a opcao Add Python to PATH.
echo Depois execute este arquivo novamente.
pause
goto :END

:ERROR
echo.
echo O servidor nao conseguiu iniciar.
echo Copie a mensagem exibida acima ou envie uma captura de tela.
pause

:END
endlocal
