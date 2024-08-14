@echo off
set "url=https://javadl.oracle.com/webapps/download/AutoDL?BundleId=249203_b291ca3e0c8548b5a51d5a5f50063037"
set "outputFile=jdk-installer.exe"
set "outputFolder=C:\Users\%username%\Downloads"

echo Downloading JDK installer from %url%...

:: Use bitsadmin to download the file
bitsadmin /transfer "DownloadingJava" "%url%" "%outputFolder%\%outputFile%"

if %errorlevel% neq 0 (
    echo Error: Download failed. Exiting script.
    pause
    exit /b
)

echo Download completed successfully!

:: Run the installer
echo Installing JDK...
start /wait "%outputFolder%\%outputFile%"

if %errorlevel% neq 0 (
    echo Error: Installation failed.
    pause
    exit /b
)

echo Installation completed successfully!

pause
