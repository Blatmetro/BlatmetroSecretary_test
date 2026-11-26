@echo off
chcp 65001 >nul
cd /d "%~dp0"

if not exist ".venv\Scripts\python.exe" goto create_venv

:install
".venv\Scripts\python.exe" -m pip install -r requirements.txt
if errorlevel 1 goto error

".venv\Scripts\python.exe" bot.py
pause
exit /b

:create_venv
py -3 -m venv .venv
if errorlevel 1 goto error
goto install

:error
echo An error occurred. Check Python installation and requirements.
pause
exit /b 1