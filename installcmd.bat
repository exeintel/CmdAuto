@echo off
chcp 65001 >nul
title cmdauto installer
color 0A

:: Check for administrator rights
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if %errorlevel% neq 0 (
    echo Requesting administrator privileges...
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs" >nul 2>&1
    exit /b
)

echo ========================================
echo      cmdauto - CMD Autostart Installer
echo      Developer: mkgirl
echo ========================================
echo.

:: Get the startup folder path
set "startup_folder=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"

echo Creating CMD shortcut in startup folder...
echo Target folder: %startup_folder%

:: Create shortcut to cmd.exe
set "shortcut_path=%startup_folder%\cmd_autostart.lnk"
set "target_path=%windir%\system32\cmd.exe"

:: Create shortcut using PowerShell
powershell -Command "$ws = New-Object -ComObject WScript.Shell; $sc = $ws.CreateShortcut('%shortcut_path%'); $sc.TargetPath = '%target_path%'; $sc.WorkingDirectory = '%USERPROFILE%'; $sc.Save()"

if exist "%shortcut_path%" (
    echo.
    echo SUCCESS: CMD shortcut has been created in the startup folder!
    echo CMD will now start automatically when you log into Windows.
) else (
    echo.
    echo ERROR: Failed to create shortcut.
    echo Please try running the script again.
)

echo.
echo Installation completed.
echo.
pause