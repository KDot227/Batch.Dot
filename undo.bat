@echo off
goto check_Permissions

:check_Permissions
    echo Administrative permissions required. Detecting permissions...
    
    net session >nul 2>&1
    if %errorLevel% == 0 (
        echo Success: Administrative permissions confirmed.
        goto fix
    ) else (
        echo run wit admin cuh
    )
    
    pause >nul

:fix
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 1 /f
tsh advfirewall firewall set rule group="remote desktop" new enable=No
echo FINISHED
exit