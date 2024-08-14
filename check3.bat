@echo off
echo Copying capicom.dll and Interop.CAPICOM.dll from %cd% to C:\Windows\System32...

xcopy "%cd%\capicom.dll" "C:\Windows\System32" /Y
xcopy "%cd%\Interop.CAPICOM.dll" "C:\Windows\System32" /Y

echo Files copied successfully to System32!

xcopy "%cd%\capicom.dll" "C:\Windows\SysWOW64" /Y
xcopy "%cd%\Interop.CAPICOM.dll" "C:\Windows\SysWOW64" /Y

echo Files copied successfully to SysWOW64!

echo Registering capicom.dll in SysWOW64...
regsvr32 /s "C:\Windows\SysWOW64\capicom.dll"
echo capicom.dll registered successfully in SysWOW64!

echo Registering capicom.dll in System32...
regsvr32 /s "C:\Windows\System32\capicom.dll"
echo capicom.dll registered successfully in System32!

pause

set "regFile=%cd%\your-registry-file.reg"

if not exist "%regFile%" (
    echo Error: Registry file "%regFile%" not found. Exiting script.
    pause
    exit /b
)

echo Importing registry settings from %regFile%...
regedit /s "%regFile%"

echo Registry settings imported successfully!

pause
