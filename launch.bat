@echo off
cd /d "%~dp0"
if [%1]==[] (exit)
title %1
for /f %%i in ('dir /b ".--plugins"') do move ".--plugins\%%i" "%2\plugins"
for /f %%i in ('dir /b ".--mods"') do move ".--mods\%%i" "%2\mods"
cd "%2"
cls
curl -kL "%3" -o "%4" --progress-bar
cls
for %%i in (*.jar) do java -Xmx10G -XX:+UnlockExperimentalVMOptions -XX:+AlwaysPreTouch -XX:+DisableExplicitGC -XX:+UseG1GC -XX:+UnlockExperimentalVMOptions -XX:MaxGCPauseMillis=50 -XX:G1HeapRegionSize=4M -XX:TargetSurvivorRatio=90 -XX:G1NewSizePercent=50 -XX:G1MaxNewSizePercent=80 -XX:InitiatingHeapOccupancyPercent=10 -XX:G1MixedGCLiveThresholdPercent=50 -XX:+AggressiveOpts -Dlog4j.configurationFile=log4j2.xml %5 -jar "%%i" %6
echo.

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