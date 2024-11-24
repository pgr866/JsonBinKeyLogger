@echo off

:: INSTALL VIRTUAL ENVIRONMENT

:: Change the current working directory to the root directory
cd /d %~dp0
cd ..

:: Python version
set /p version=<python_version.txt
:: Python folder name
set "name=Python%version:~0,1%%version:~2,2%"
:: Python path
set python=%userprofile%\AppData\Local\Programs\Python\%name%\python.exe

:: Create Python venv
%python% -m venv venv
call %cd%\venv\Scripts\activate.bat

:: New Python venv path
set python=%cd%\venv\Scripts\python.exe

:: Check python version
%python% --version

echo.
echo Python virtual environment installed
echo.
pause
