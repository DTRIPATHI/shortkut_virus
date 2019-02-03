:select
@echo off
echo 1 - remove virus
echo 2 - delete files (beta)
echo 3 - kill task
echo 4 - copy files (alpha)
echo 5 - exit
set /p option= 
if %option%==1 goto disk
if %option%==2 goto file
if %option%==3 goto task
if %option%==4 goto out
if %option%==5 goto die

:disk
set /p path="Enter the drive letter: "
C:\Windows\System32\attrib.exe -r -a -s -h /s /d %path%:\*.*
echo taking permissions from VIRUS
goto select

:file
set /p path="Enter the drive letter: "
del %path%:\*.lnk
echo delete shortkut
del /s %path%:\*.
echo delete empty files
del /s %path%:\WPSettings.dat
echo delete some windows files
rmdir %path%:\"System Volume Information"
echo removing a windows directory
del /s *.ini
echo delete windows ini files
cd h:
for %%a in (*) do ( 
	if ".%%~na" == "%%~xa" (del /s "%%~na""%%~xa")
)
echo delete main VIRUS file
goto select

:task
echo WARNING! This will kill Windows MSI installer 
pause
C:\Windows\System32\taskkill.exe /IM msiexec.exe /f
echo kiss my ass msi installer
goto select

:out
xcopy /c /k /e /r /y "H:\ \" C:\temp
pause
del /f /s /q h:
pause
C:\Windows\System32\taskkill.exe /IM msiexec.exe /f
pause
C:\Windows\System32\attrib.exe -r -a -s -h /s /d h:\*.*
rmdir /s /q h:\
pause
xcopy /c /k /e /r /y "C:\temp\ \" H:\
pause

:die
exit