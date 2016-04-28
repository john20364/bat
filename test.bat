ECHO OFF 

SETLOCAL ENABLEDELAYEDEXPANSION

START %1 php -f c:\xampp\htdocs\esb\php\zones.php
::START "zones.php" php -f c:\xampp\htdocs\esb\php\zones.php
::START "zones.php" php -f c:\xampp\htdocs\esb\php\zones.php
::START "locations.php" php -f c:\xampp\htdocs\esb\php\zones.php
::START "locations.php" php -f c:\xampp\htdocs\esb\php\zones.php
::START "locations.php" php -f c:\xampp\htdocs\esb\php\zones.php
::
::call :killtask "zones.php"
::call :killtask "locations.php"

:killtask %1
for /f "tokens=*" %%a in ('tasklist /v /fo csv ^| findstr /c:"%1"') do (
	set /A count = 0
	set pid=
	set procesname=""

	for %%b in (%%a) do (
		set /A count = count + 1
REM		echo %%b
		if !count! == 1 (
			echo %%b
			set procesname = %%b
			echo !procesname!
		)
		if !count! == 2 (
			set /a pid = %%b
			echo !procesname!!pid!
		)
	)
)

ENDLOCAL


			::if !procesname! == "php.exe"(
			::	echo !pid!
			::	taskkill /pid !pid!
			::)
