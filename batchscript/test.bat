@echo off
:start
set /p math=equation?
set /a result=%math%
echo %result%
if %result%==5 start notepad.exe
pause
cls
goto start