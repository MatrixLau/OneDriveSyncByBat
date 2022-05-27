@REM @echo off


setlocal enabledelayedexpansion

set DIRFILE=E:\folderchangesview\FolderChangesView.cfg
set outputFile=E:\folderchangesview\FolderChangesView.cfg.bak
set /a number=0

@REM findstr /R "^BaseFolder=*" %DIRFILE%

set /a DIRFILECOUNT=0
for /f "tokens=*" %%s in ( %DIRFILE% ) do (
    set /a DIRFILECOUNT+=1
    set a=%%s
    if !DIRFILECOUNT! == 7 ( set a=!a:%%s=%%s777! )
    echo !a! >> %outputFile%
)
@REM set newStr=%oldStr%++

@REM :replace
@REM set /a i=0
@REM for /f "tokens=* delims=:" %%i in (%DIRFILE%) do (
@REM 	set "a=%%i"
@REM 	if %number% == 0 (
@REM 		set "b=!a:%oldStr%=%newStr%!"
@REM 	) else (
@REM 		set "b=!a!"
@REM 		if not "!a!" == "!a:%oldStr%=%newStr%!" (
@REM 			set /a i+=1
@REM 			if %number% == !i! (
@REM 				set "b=!a:%oldStr%=%newStr%!"
@REM 			)
@REM 		)
@REM 	)
@REM 	REM 如果某行内容为空格或多个空格，输出的到文件中的那行内容是echo is on 或者echo is off
@REM 	echo !b!>>%outputFile%
@REM )
