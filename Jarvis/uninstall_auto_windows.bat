@echo off
echo Starting full automated cleanup on Windows...

:: Kill any running Python processes
taskkill /F /IM python.exe >nul 2>&1

:: Remove project folder
rmdir /S /Q %USERPROFILE%\voice_assistant

:: Uninstall pip packages
pip uninstall -y SpeechRecognition virtualenv

:: Uninstall Python via Chocolatey
choco uninstall -y python

:: Remove Python-related folders
rmdir /S /Q %LOCALAPPDATA%\Programs\Python
rmdir /S /Q %APPDATA%\Python
rmdir /S /Q %USERPROFILE%\AppData\Roaming\Python
rmdir /S /Q %USERPROFILE%\AppData\Local\pip
rmdir /S /Q %USERPROFILE%\AppData\Roaming\pip

:: Uninstall Chocolatey
rmdir /S /Q C:\ProgramData\chocolatey
reg delete HKLM\Software\Chocolatey /f >nul 2>&1

echo ✅ Full automated cleanup complete on Windows.
pause
