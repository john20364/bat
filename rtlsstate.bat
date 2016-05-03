@ECHO OFF >nul

SETLOCAL ENABLEDELAYEDEXPANSION

set title=%1
set found="FALSE"

for /f "tokens=*" %%a in ('tasklist /v /fo csv ^| findstr /c:"%1"') do (
	set /A count = 0

	for %%b in (%%a) do (
		set /A count = count + 1
		if !count! == 1 (
			call :Func1 %%b
		)

		if !count! == 9 (
			call :Func2 %%b
		)
	)
)

if !found! == "FALSE" (
	@ECHO Stream !title! is NOT running.
)

:Func1
if /i %1 == "php.exe" (
	set processname=%1
)
goto :eof

:Func2
if /i !processname! == "php.exe" (
	@ECHO Stream !title! is running.
	set found="TRUE"
)
goto :eof

:End
