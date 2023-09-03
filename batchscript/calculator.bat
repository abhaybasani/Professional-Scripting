@echo off
:start 
set /p MATH=enter the data:?
set /a RESULT=%MATH%
echo %RESULT%
if %RESULT%==5 start notepad.exe
pause 
cls
goto start