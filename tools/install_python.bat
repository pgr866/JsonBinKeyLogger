@echo off

:: INSTALL PYTHON

:: Change the current working directory to the root directory
cd /d %~dp0
cd ..

:: Python version
set /p version=<python_version.txt
:: Python folder name
set "name=Python%version:~0,1%%version:~2,2%"

:: Download and install Python
set "name=Python%version:~0,1%%version:~2,2%"
curl -L -o python-%version%-amd64.exe https://www.python.org/ftp/python/%version%/python-%version%-amd64.exe
powershell -Command "Start-Process 'python-%version%-amd64.exe' -ArgumentList '/quiet', 'InstallAllUsers=1', 'PrependPath=1', 'TargetDir=%userprofile%\AppData\Local\Programs\Python\%name%\' -Wait -Verb RunAs"
del python-%version%-amd64.exe

echo Python %version% installation finished successfully.
pause
