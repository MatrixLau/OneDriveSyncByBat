@echo off
setLocal EnableDelayedExpansion

@REM 若OneDrive没有设置环境变量请手动设置OneDrive位置
set ONEDRIVEPATH=C:\OneDrive
set FILENAME=OneDriveSync_process
set FILETYPE=.txt

if not exist %OneDrive% (
    if exist %ONEDRIVEPATH% ( goto process )
    else ( goto not_found_onedrive )
) else (
    goto pre_process
)

:not_found_onedrive
echo "PLEASE SET UP YOUR ONEDRIVE FIRST!!!"
pause
goto :EOF

:pre_process
set ONEDRIVEPATH=%OneDrive%
set ONEDRIVESYNCFILE=%ONEDRIVEPATH%\%FILENAME%%FILETYPE%
goto process

:process
goto rename_file

:rename_file
set /a FINDFILECOUNT=0
for %%a in ( %ONEDRIVEPATH%\* ) do (
    set FINDFILE=%%a
    if not "x!FINDFILE:%FILENAME%=!"=="x!FINDFILE!" (
        set /a FINDFILECOUNT+=1
        ren "%%a" "%FILENAME%%date:~0,4%%date:~5,2%%date:~8,2%_%time:~0,2%%time:~3,2%%time:~6,2%%time:~9,2%%FILETYPE%"
    )
)
if !FINDFILECOUNT! == 0 (
    echo "This an auto-create file while you are running OneDrieSync.bat" > %ONEDRIVESYNCFILE%
)
echo Syncing...
goto :EOF