@echo off

:: Step 1: Install Chocolatey (if not installed)
choco -v >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo Installing Chocolatey...
    @powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))"
)

:: Step 2: Install Python 3 (if not installed)
python --version >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo Installing Python 3...
    choco install python
) ELSE (
    echo Python 3 is already installed.
)

:: Step 3: Install pip3 (if not installed)
python -m ensurepip --upgrade

:: Step 4: Install virtualenv (if not installed)
pip show virtualenv >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo Installing virtualenv...
    pip install virtualenv
)

:: Step 5: Clone your Jarvis code from the repo (if not done already)
echo Cloning Jarvis project into current directory...
git clone https://github.com/your-repo/voice_assistant.git

:: Step 6: Navigate to the project folder
cd voice_assistant

:: Step 7: Create and activate the virtual environment
python -m venv venv
call venv\Scripts\activate.bat

:: Step 8: Install dependencies
pip install -r requirements.txt

:: Step 9: Run the Assistant
python main.py
