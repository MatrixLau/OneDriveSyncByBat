@echo off

set ONEDRIVEPATH=YOURONEDRIVEPATH
set FILENAME=OneDriveSycn_process
set FILETYPE=.txt
@REM echo %ONEDRIVEPATH%

if not exist %OneDrive% (
    goto not_found_onedrive
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
if exist %ONEDRIVESYNCFILE% ( 
    goto check_file 
) else ( 
    goto create_file
)

:create_file
md %ONEDRIVESYNCFILE%
goto rename_file

:check_file
@REM set ONEDRIVESYNCFILECONTENT=type E:\OneDrive\OneDriveSycn_process.txt
@REM type E:\OneDrive\OneDriveSycn_process.txt > %ONEDRIVESYNCFILECONTENT%
@REM if %ONEDRIVESYNCFILECONTENT% == %date%%time% ( echo "NOT SO HURRY!" ) else ( goto write_file )
goto rename_file
goto :EOF

@REM :write_file
@REM echo %date%%time% > %ONEDRIVESYNCFILE%
@REM echo Sycning...
@REM goto :EOF

:rename_file
for %%a in ( %ONEDRIVEPATH%\* ) do (
    set FINDFILE=%%a
    setLocal EnableDelayedExpansion
    if not "x!FINDFILE:%FILENAME%=!"=="x!FINDFILE!" (
        ren "%%a" "%FILENAME%%date:~0,4%%date:~5,2%%date:~8,2%_%time:~0,2%%time:~3,2%%time:~6,2%%time:~9,2%%FILETYPE%"
    )
    endlocal
)
echo Sycning...
goto :EOF