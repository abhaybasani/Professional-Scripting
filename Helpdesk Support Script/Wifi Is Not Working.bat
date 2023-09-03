@echo off

echo *******************************************************************
echo *******************************************************************
echo **                 This script is build by                       ** 
echo **                      Abhay Basani                             ** 
echo *******************************************************************
echo.*******************************************************************
echo.
pause

echo "this script only if your wifi network is not working"

echo " We are flushing your DNS"
ipconfig /flushdns

echo "We are release you old wifi IP for get the new one"
ipconfig /release
ipconfig /renew
ipconfig

pause

echo.
@echo off
netsh interface set interface "Wi-Fi" admin=enabled
netsh interface set interface "Wi-Fi" admin=disabled
echo Wi-Fi services have been started.

:: Start WLAN AutoConfig service (Wi-Fi)
sc start Wlansvc

:: Start WLAN AutoConfig service (Wi-Fi) on a delayed start (optional)
:: sc config Wlansvc start=delayed-auto

echo Wi-Fi services have been started.
pause