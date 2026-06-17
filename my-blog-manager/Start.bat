@echo off
cd /d "%~dp0"

echo Starting XingHui Console...

python --version >/dev/null 2>&1
if %errorlevel% neq 0 (
    echo Python not found! Please install Python 3.10+ and add to PATH.
    pause
    exit /b 1
)

echo Checking dependencies...
python run_me.py
if %errorlevel% neq 0 (
    echo Dependency check failed. See above for details.
    pause
    exit /b 1
)

echo Starting application...

where pythonw >/dev/null 2>&1
if %errorlevel% equ 0 (
    start "" pythonw launcher.py
) else (
    start "" python launcher.py
)

echo Done!
