ECHO OFF 

SETLOCAL ENABLEDELAYEDEXPANSION

for /f "tokens=*" %%a in ('tasklist /v /fo csv ^| findstr /c:"%1"') do (
	set /A count = 0

	for %%b in (%%a) do (
		set /A count = count + 1
		if !count! == 1 (
			call :Func1 %%b
		)

		if !count! == 2 (
			call :Func2 %%b
		)
	)
)

:Func1
if /i %1 == "cmd.exe" (
	set processname=%1
)
goto :eof

:Func2
if /i !processname! == "cmd.exe" (
	taskkill /pid %1
)
goto :eof

:End
