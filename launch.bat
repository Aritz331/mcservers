@echo off
cd /d "%~dp0"
if [%~1]==[] (exit)
title %~1
for /f %%i in ('dir /b ".--plugins"') do move ".--plugins\%%i" "%2\plugins"
for /f %%i in ('dir /b ".--mods"') do move ".--mods\%%i" "%2\mods"
cd "%~2"
cls
curl -kL "%~3" -o "%~4" --progress-bar
cls
java -Xmx10G -XX:+UnlockExperimentalVMOptions -XX:+UseG1GC -XX:G1NewSizePercent=20 -XX:G1ReservePercent=20 -XX:MaxGCPauseMillis=50 -XX:G1HeapRegionSize=32M -Dlog4j.configurationFile=log4j2.xml %~5 -jar "%~4" %~6
pause
echo.
exit /b

title auto comiter xd
cd ..
<nul set /p "=comiting..."
git add * >nul 2>&1
git commit -a -m "auto comit lolz" >nul 2>&1
git push >nul 2>&1
echo OK!
echo.
cd..
timeout 3
exit /b