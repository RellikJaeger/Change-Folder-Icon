@echo off
setlocal
set currentPath=%cd%
for /f "delims=" %%i in ('iconChooser.bat') do (
	set "iconPath=%%i"
	echo %%i
)
attrib -s -h "[!] Covers"
md "[!] Covers"
copy "%iconPath%" "%currentPath%\[!] Covers"
attrib -s -h desktop.ini
(
	echo [.ShellClassInfo]
	echo ConfirmFileOp=0
	echo NoSharing=0
	echo IconFile=[!] Covers\cover.ico
	echo IconIndex=0
)>desktop.ini
attrib +s +h desktop.ini
attrib +a +r .
ie4uinit -show

:GUI
call gui
