dism /online /Add-Package /PackagePath:lp.cab

@ECHO OFF
IF %ERRORLEVEL% == 0 goto good

ECHO !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
ECHO !!                                 !!
ECHO !! A nyelv telepitese nem sikerult !!
ECHO !!                                 !!
ECHO !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
ECHO Kerem olyan lp.cab fajlt hasznaljon, 
ECHO amely az On rendszerehez valo.
ECHO ON
goto end

:good
ECHO ON
MD backup
REGEDIT.EXE /E backup/backup_mui1.reg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\MUI\UILanguages"
REGEDIT.EXE /E backup/backup_mui2.reg "HKEY_CURRENT_USER\Control Panel\Desktop\MuiCached"
REGEDIT.EXE /E backup/backup_mui3.reg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Nls\Language"
REGEDIT.EXE /E backup/backup_mui4.reg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Nls\Locale"
REGEDIT.EXE /E backup/backup_mui5.reg "HKEY_USERS\.DEFAULT\Control Panel\Desktop\MuiCached"

REGEDIT /S ui_hu.reg

bcdedit /set locale hu-HU
bcdedit /set {bootmgr} locale hu-HU
bcdedit /set {default} locale hu-HU
bcdedit /set {current} locale hu-HU
bcdedit /set {memdiag} locale hu-HU

:end