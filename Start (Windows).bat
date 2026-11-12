@echo off
rem Double-click this file to open the Trader Dashboard on Windows.
title Trader Dashboard
cd /d "%~dp0"

set "PY="
where py >nul 2>nul && set "PY=py -3"
if not defined PY ( where python >nul 2>nul && set "PY=python" )
if not defined PY ( where python3 >nul 2>nul && set "PY=python3" )

if not defined PY goto nopython
%PY% -c "import sys; sys.exit(0 if sys.version_info >= (3, 9) else 1)" >nul 2>nul
if errorlevel 1 goto nopython

echo Starting Trader Dashboard...
%PY% -I app\server.py
echo.
echo The dashboard has stopped. Your data is saved in the "trader" folder.
pause
exit /b

:nopython
echo.
echo  Python 3.9 or newer is needed and was not found.
echo.
echo  1. Opening the Python download page now.
echo  2. Run the installer and TICK "Add python.exe to PATH" on the first screen.
echo  3. Then double-click "Start (Windows)" again.
echo.
start "" "https://www.python.org/downloads/"
pause
