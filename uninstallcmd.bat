@echo off
chcp 65001 >nul
title cmdauto uninstaller
color 0C

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
echo     cmdauto - CMD Autostart Uninstaller
echo      Developer: mkgirl
echo ========================================
echo.

:: Get the startup folder path
set "startup_folder=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"
set "shortcut_path=%startup_folder%\cmd_autostart.lnk"

echo Looking for CMD shortcut in startup folder...
echo Target folder: %startup_folder%

if exist "%shortcut_path%" (
    echo Found shortcut: cmd_autostart.lnk
    echo Removing shortcut...
    del "%shortcut_path%"
    
    if not exist "%shortcut_path%" (
        echo.
        echo SUCCESS: CMD shortcut has been removed from startup!
        echo CMD will no longer start automatically when you log into Windows.
    ) else (
        echo.
        echo ERROR: Failed to remove shortcut.
        echo Please try running the script again.
    )
) else (
    echo.
    echo INFO: CMD shortcut not found in startup folder.
    echo Either it was already removed or never installed.
)

echo.
echo Uninstallation completed.
echo.
pause