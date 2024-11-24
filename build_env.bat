@echo off

:: BUILD PYTHON ENVIRONMENT

echo Installing Python...
cd tools
call install_python.bat

echo Creating virtual environment...
cd tools
call install_venv.bat

echo Installing requirements...
cd tools
call install_requirements.bat

echo Environment setup completed.
echo.
pause
