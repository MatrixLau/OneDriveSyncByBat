@echo off
@REM 若OneDrive没有设置环境变量请手动设置OneDrive位置
set ONEDRIVEPATH=C:\OneDrive
set FILENAME=OneDriveSycn_process.txt
@REM echo %ONEDRIVEPATH%

if not exist %OneDrive% (
    if exist %ONEDRIVEPATH% ( goto process )
    else ( goto not_found_onedrive )
) else (
    goto pre_process
)

:not_found_onedrive
echo "PLEASE SET UP YOUR ONEDRIVE FIRST!!!"
goto :EOF

:pre_process
set ONEDRIVEPATH=%OneDrive%
set ONEDRIVESYNCFILE=%ONEDRIVEPATH%\%FILENAME%
goto process

:process
if exist %ONEDRIVESYNCFILE% ( 
    goto check_file 
) else ( 
    goto create_file
)

:create_file
md %ONEDRIVESYNCFILE%
goto write_file

:check_file
@REM set ONEDRIVESYNCFILECONTENT=type E:\OneDrive\OneDriveSycn_process.txt
@REM type E:\OneDrive\OneDriveSycn_process.txt > %ONEDRIVESYNCFILECONTENT%
@REM if %ONEDRIVESYNCFILECONTENT% == %date%%time% ( echo "NOT SO HURRY!" ) else ( goto write_file )
goto write_file
goto :EOF

:write_file
echo %date%%time% > %ONEDRIVESYNCFILE%
echo Sycning...
goto :EOF
