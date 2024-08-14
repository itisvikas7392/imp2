echo Copying capicom.dll and Interop.CAPICOM.dll from %cd% to C:\Windows\System32...

xcopy "%cd%\capicom.dll" "C:\Windows\System32" /Y
xcopy "%cd%\Interop.CAPICOM.dll" "C:\Windows\System32" /Y

echo Files copied successfully to System32!

xcopy "%cd%\capicom.dll" "C:\Windows\SysWOW64" /Y
xcopy "%cd%\Interop.CAPICOM.dll" "C:\Windows\SysWOW64" /Y
 
 
regsvr32 "C:\Windows\SysWOW64\capicom.dll"
regsvr32 "C:\Windows\System32\capicom.dll"




pause


set "regFile=%cd%"

if not exist "%regFile%" (
    echo Error: Registry file "%regFile%" not found. Exiting script.
    pause
    exit /b
)

echo Importing registry settings from %regFile%...
regedit /s "%regFile%"

echo Registry settings imported successfully!

pause