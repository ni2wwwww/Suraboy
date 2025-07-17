@echo off
set SCRIPT=main.py

:: Auto-detect python path
for /f "delims=" %%i in ('where python') do (
    set PYTHON=%%i
    goto found
)

:found
:: Get full path to this BAT file's directory
set DIR=%~dp0
set NSSM=%DIR%nssm.exe

:: Check if nssm.exe is there
if not exist "%NSSM%" (
    echo [ERROR] Please place nssm.exe in the same folder as this script!
    pause
    exit /b
)

:: Install service
"%NSSM%" install MyPythonBot "%PYTHON%" "%DIR%%SCRIPT%"
"%NSSM%" set MyPythonBot Start SERVICE_AUTO_START

:: Start the service
"%NSSM%" start MyPythonBot

echo [SUCCESS] Service installed and started: MyPythonBot
pause
