@echo off

echo Copying files from C:\Users\%username%\Downloads\cap\cap to C:\Windows\System32...

xcopy "C:\Users\%username%\Downloads\cap\cap" "C:\Windows\System32" /E /Y

echo Files copied successfully! for 32 bit

xcopy "C:\Users\%username%\Downloads\cap\cap" "C:\Windows\SysWOW64" /E /Y

echo Files copied successfully! for 64 bit

cd /d "C:\Windows\System32"
call "Windows7-64bit.bat"

echo Executed Windows7-64bit.bat

cd /d "C:\Windows\SysWOW64"
call "Windows7-64bit.bat"

echo Executed Windows7-64bit.bat

:: Delete the folder after successful operations
rmdir /s /q "C:\Users\%username%\Downloads\cap\cap"
echo Folder C:\Users\%username%\Downloads\cap\cap deleted successfully!


