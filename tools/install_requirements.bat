@echo off

:: INSTALL REQUIREMENTS

:: Admin request
net session >nul 2>&1
if %errorLevel% neq 0 ( powershell Start-Process "%0" -Verb RunAs & exit /b )

:: Change the current working directory to the root directory
cd /d %~dp0
cd ..

:: Python venv path
set python=%cd%\venv\Scripts\python.exe

:: Install pip
curl -o get-pip.py https://bootstrap.pypa.io/get-pip.py
%python% get-pip.py
del get-pip.py

:: Install libraries listed in requirements.txt
%python% -m pip install -U -r requirements.txt

:: Check python version
%python% --version

:: List installed libraries
%python% -m pip list

echo.
echo All requirements installed
echo.
pause
