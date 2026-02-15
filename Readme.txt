cmdauto
CMD Autostart Installer/Uninstaller
Developer: ExEintel 
Version: 1.0

About the Project
cmdauto is a simple utility consisting of two batch files that allow you to easily add or remove Command Prompt (cmd.exe) from Windows startup. This tool automatically configures Windows to launch CMD every time you log into your system.

Purpose
Automatically open Command Prompt at system startup

Quick access to CMD for developers and system administrators

Educational purposes for understanding Windows startup mechanisms

Easy toggle functionality with separate install/uninstall scripts

Features
Automatic UAC elevation for administrator privileges

Creates shortcut in Windows Startup folder

Uses PowerShell for reliable shortcut creation

Simple one-click installation and removal

Clear success/error messaging

No permanent system changes

System Requirements
Operating System: Windows 7/8/10/11

Privileges: Administrator rights required (auto-requested)

Disk Space: Less than 1 MB

Dependencies: PowerShell (pre-installed on modern Windows)

Installation
Files Included
installcmd.bat - Installs CMD to startup

uninstallcmd.bat - Removes CMD from startup

Setup Instructions
Download both batch files to any folder

No additional installation required

Keep both files together for easy management

Usage Instructions
Installing CMD Autostart
Double-click installcmd.bat

If prompted by UAC, click "Yes" to allow administrator access

Wait for the installation to complete

Read the on-screen message to confirm success

CMD will now launch automatically on next login

Uninstalling CMD Autostart
Double-click uninstallcmd.bat

If prompted by UAC, click "Yes" to allow administrator access

Wait for the uninstallation to complete

Read the on-screen message to confirm removal

CMD will no longer launch at startup

How It Works
Technical Process
Privilege Elevation:

Script checks for administrator rights

Creates temporary VBS script if elevation needed

Relaunches itself with admin privileges

Installation Process:

Locates Windows Startup folder: %APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup

Uses PowerShell COM object to create shortcut

Shortcut targets: %windir%\system32\cmd.exe

Working directory set to user profile

Uninstallation Process:

Checks for existing shortcut

Deletes cmd_autostart.lnk from Startup folder

Verifies successful removal

File Locations
Item	Path
Startup Folder	%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup
Shortcut	%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\cmd_autostart.lnk
Target	%windir%\system32\cmd.exe
User Interface
Installer Screen
text
========================================
     cmdauto - CMD Autostart Installer
     Developer: mkgirl
========================================

Creating CMD shortcut in startup folder...
Target folder: C:\Users\Username\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup

SUCCESS: CMD shortcut has been created in the startup folder!
CMD will now start automatically when you log into Windows.

Installation completed.
Press any key to continue...
Uninstaller Screen
========================================
    cmdauto - CMD Autostart Uninstaller
     Developer: ExEintel 
========================================

Looking for CMD shortcut in startup folder...
Target folder: C:\Users\Username\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
Found shortcut: cmd_autostart.lnk
Removing shortcut...

SUCCESS: CMD shortcut has been removed from startup!
CMD will no longer start automatically when you log into Windows.

Uninstallation completed.
Press any key to continue...
Error Handling
Common Scenarios
Scenario	Script Response
Already installed (install)	Creates duplicate shortcut (both will run)
Already uninstalled (uninstall)	Shows "Shortcut not found" message
UAC denied	Script exits without changes
PowerShell unavailable	Shortcut creation fails with error
Error Messages
"Failed to create shortcut" - Check PowerShell availability

"Failed to remove shortcut" - Check file permissions

"Requesting administrator privileges..." - Normal UAC prompt

Use Cases
For Developers
Quick access to command line for build processes

Monitoring development servers at startup

Running development tools automatically

For System Administrators
Remote management preparation

Automated maintenance scripts

System monitoring at login

For Education
Teaching Windows startup mechanisms

Demonstrating shortcut creation

Understanding UAC and privileges

Technical Notes
Shortcut Properties
Name: cmd_autostart.lnk

Target: C:\Windows\System32\cmd.exe

Start in: %USERPROFILE%

Run: Normal window

Comment: (none)

Registry Impact
This tool does not modify the Windows Registry. It only uses the standard Startup folder, which is the recommended method for user-level autostart applications.

Security Considerations
Scripts self-elevate using VBS (common technique)

Only modifies user's Startup folder, not system-wide startup

No network access or data collection

Easy to verify by checking Startup folder manually

Uninstallation
Automatic (Recommended)
Run uninstallcmd.bat as described above.

Manual
Press Win + R

Type: shell:startup

Press Enter

Delete cmd_autostart.lnk

Close the folder

Compatibility Notes
Works on all Windows versions with PowerShell

Tested on Windows 7, 8, 10, 11

32-bit and 64-bit compatible

Language-independent (uses system paths)

Limitations
Installs for current user only (not system-wide)

Requires UAC confirmation on first run

Cannot configure CMD window properties (size, position, colors)

Multiple installations create multiple shortcuts

Troubleshooting
Issue: Script doesn't request administrator rights
Solution: Right-click and select "Run as administrator" manually

Issue: Shortcut doesn't appear at next login
Solution: Check Startup folder manually to verify shortcut exists

Issue: Two CMD windows open at startup
Solution: Run uninstaller and then installer again to have only one

Issue: PowerShell error on Windows 7
Solution: Ensure PowerShell is installed (optional Windows component)

Version History
v1.0 (Current)
Initial release

Basic install/uninstall functionality

Automatic UAC elevation

PowerShell-based shortcut creation

User-friendly console interface

License
Free for personal and educational use. Use at your own risk.

Author
Developer: ExEintel 
Project: cmdauto - CMD Autostart Manager
Last Updated: February 2026

Simple. Reliable. Just adds CMD to startup.

