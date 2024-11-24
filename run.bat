@echo off

:: RUN MAIN.PY

:: Change the current working directory to the directory where the batch script is located
cd /d %~dp0

:: Python venv path
set python=%cd%\venv\Scripts\python.exe

:: Run main.py
%python% main.py
