@echo off
echo "Temp file is going to delete. Please Wait........."

echo *******************************************************************
echo *******************************************************************
echo **                 This script is build by                       ** 
echo **                      Abhay Basani                             ** 
echo *******************************************************************
echo.*******************************************************************
echo.
pause
echo "we are cleaning your Temp files........."

del /s /f /q c:\windows\temp\*.*
rd /s /q c:\windows\temp
md c:\windows\temp

echo "We are clean your Prefetch files......"

del /s /f /q C:\WINDOWS\Prefetch
del /s /f /q %temp%\*.*
rd /s /q %temp%
md %temp%
deltree /y c:\windows\tempor~1
deltree /y c:\windows\temp
deltree /y c:\windows\tmp
deltree /y c:\windows\ff*.tmp
deltree /y c:\windows\history
deltree /y c:\windows\cookies
deltree /y c:\windows\recent
deltree /y c:\windows\spool\printers
del c:\WIN386.SWP
cd /
erase /f /q /s *.tmp

echo " cleaning prefetch files"

DEL /F/S/Q %WINDIR%\Prefetch\*.*

echo "*************   System Scan for better work  ****************"
echo " sfc /scannow cmd is running......"
sfc/scannow
echo.
echo "running Dism /Online /Cleanup-Image /ScanHealth please wait......."
Dism /Online /Cleanup-Image /ScanHealth
echo.
Dism /Online /Cleanup-Image /RestoreHealth
echo "your all file has been clean thanks for using my tool"
echo "                              -Abhay Basani           "
pause


