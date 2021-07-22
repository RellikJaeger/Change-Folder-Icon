@echo off
setlocal
set currentPath=%cd%
for /f "delims=" %%i in ('iconChooser.bat') do (
	set "iconPath=%%i"
	echo %%i
)
attrib -s -h "[!] Covers"
md "[!] Covers"
echo h
copy "%iconPath%" "%currentPath%\[!] Covers"
attrib -s -h desktop.ini
echo [.ShellClassInfo] >desktop.ini
echo IconResource=[!] Covers\cover.ico,0 >>desktop.ini
echo [ViewState] >>desktop.ini
echo Mode= >>desktop.ini
echo Vid= >>desktop.ini
echo FolderType=Videos >>desktop.ini
attrib +s +h "[!] Covers"
attrib +s +h desktop.ini
ie4uinit -show

:GUI
call gui
