@echo off
where powershell >nul 2>nul
if %errorlevel% neq 0 (
    echo PowerShell is not installed. Installing PowerShell...
    winget install --id Microsoft.Powershell --source winget
    if %errorlevel% neq 0 (
        echo Failed to install PowerShell. Please install it manually.
        pause
        exit /b 1
    )
)

powershell -Command "Set-ExecutionPolicy RemoteSigned -Force"
powershell -File "%~dp0ConvertToJPG.ps1"
pause