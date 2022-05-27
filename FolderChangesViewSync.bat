@echo off

setlocal enabledelayedexpansion

@REM Input your FolderChangesView path in DIRFILE, and make sure FolderChangesView is not running while you running this .bat
@REM 请在DIRFILE填入你的FolderChangesView配置文件路径 且请在FolderChangesView关闭时运行本脚本
set DIRFILE=E:\folderchangesview\FolderChangesView.cfg

set /a number=0

dir %OneDrive% | findstr "<SYMLINKD>" > %OneDrive%\OneDriveSync_pathtemp
for /f "tokens=2* delims=[]" %%s in ( %OneDrive%\OneDriveSync_pathtemp ) do (
    set /a number+=1
    if !number! == 1 (
        set SYNCPATH=%%s
    ) else (
        set SYNCPATH=!SYNCPATH!,%%s
    )
)

@REM findstr /R "^BaseFolder=*" %DIRFILE%
set /a DIRFILECOUNT=0
for /f "tokens=*" %%s in ( %DIRFILE% ) do (
    set /a DIRFILECOUNT+=1
    set a=%%s
    if !DIRFILECOUNT! == 7 ( 
        set a=!a:~0,11!!SYNCPATH!
    )
    if !DIRFILECOUNT! == 1 (
        echo !a! > %DIRFILE%
    ) else (
        echo !a! >> %DIRFILE%
    )
)
echo Updated Symbolic Link Folders
