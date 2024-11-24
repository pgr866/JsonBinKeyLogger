@echo off

:: GENERATE EXECUTABLE

:: Change the current working directory to the directory where the batch script is located
cd /d "%~dp0"
cd ..

:: Python venv path
set python=%cd%\venv\Scripts\python.exe

:: Install pyinstaller
%python% -m pip install -U pyinstaller

:: pyinstaller path
set pyinstaller=%cd%\venv\Scripts\pyinstaller.exe

:: config.spec path
set spec=%cd%\tools\config.spec

:: Generate executable
%pyinstaller% %spec%

move dist\SecurityHealthService.exe .
rmdir /s /q build
rmdir /s /q dist

echo.
pause
