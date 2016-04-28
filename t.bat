ECHO OFF 

SETLOCAL ENABLEDELAYEDEXPANSION

START "locations.php" /MIN php -f c:\xampp\htdocs\esb\php\zones.php
START %1 /MIN php -f c:\xampp\htdocs\esb\php\zones.php

:killtask %1
set testvar=

for /f "tokens=*" %%a in ('tasklist /v /fo csv ^| findstr /c:"%1"') do (
	set /A count = 0
	set pid=
	set procesname=""

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
if /i %1 == "php.exe" (
	set testvar=%1
)
goto :eof

:Func2
if /i !testvar! == "php.exe" (
	taskkill /pid %1
)
goto :eof

:End

ENDLOCAL


			::if !procesname! == "php.exe"(
			::	echo !pid!
			::	taskkill /pid !pid!
			::)
