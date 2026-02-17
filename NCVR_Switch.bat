@echo off
SET "API_URL=https://script.google.com/home/projects/1QuHZQXxMV-x7I28r_jYPmZgaKolH5nwQVyDY-Zd9_OK6cPrxMKRpAgfJ"
SET "DRIVERS_PATH=C:\Program Files (x86)\Steam\steamapps\common\SteamVR\drivers"
SET "BACKUP_PATH=C:\NCVR\Drivers_Backup"

:LOOP
cls
echo [NCVR] Checking Master Sheet for protocol update...
curl -L -s %API_URL% > %TEMP%\ncvr_status.json

:: Define Log Path
SET "LOG_FILE=C:\NCVR\Logs\session_log.txt"

:: Logic for a Protocol Change
if NOT "%NEW_PROTO%"=="%CURRENT_PROTO%" (
    echo [%DATE% %TIME%] [CHANGE] Switch triggered: %CURRENT_PROTO% -> %NEW_PROTO% >> "%LOG_FILE%"
    
    :: Your taskkill and xcopy logic here...
    
    if %ERRORLEVEL% EQU 0 (
        echo [%DATE% %TIME%] [SUCCESS] %NEW_PROTO% driver active. >> "%LOG_FILE%"
    ) else (
        echo [%DATE% %TIME%] [ERROR] Driver swap failed for %NEW_PROTO%. >> "%LOG_FILE%"
    )
)


:: Simple check for protocol name in the JSON response
findstr /I "iVRy" %TEMP%\ncvr_status.json >nul && SET "NEW_PROTO=iVRy"
findstr /I "ALVR" %TEMP%\ncvr_status.json >nul && SET "NEW_PROTO=ALVR"

if "%NEW_PROTO%"=="%CURRENT_PROTO%" (
    echo [NCVR] Protocol matches. Sleeping 30s...
) else (
    echo [NCVR] New Protocol Detected: %NEW_PROTO%
    taskkill /F /IM vrmonitor.exe /T >nul 2>&1
    timeout /t 2
    
    :: Swap the folders
    rmdir /S /Q "%DRIVERS_PATH%\ncvr_active" >nul 2>&1
    xcopy /S /I /Y "%BACKUP_PATH%\%NEW_PROTO%" "%DRIVERS_PATH%\ncvr_active"
    
    SET "CURRENT_PROTO=%NEW_PROTO%"
    echo [NCVR] Switched to %NEW_PROTO%. Restarting SteamVR...
    start "" "C:\Program Files (x86)\Steam\steamapps\common\SteamVR\bin\win64\vrstartup.exe"
)

timeout /t 30
goto LOOP