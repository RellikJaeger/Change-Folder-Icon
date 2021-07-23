@echo off
setlocal
set currentPath=%cd%
for /f "delims=" %%i in ('iconChooser.bat') do (
	set "iconPath=%%i"
	echo %%i
)
attrib -s -h "[!] Covers"
for %%a in ("%~p0.") do set par="%%~nxa"
attrib -r %par%
md "[!] Covers"
copy "%iconPath%" "%currentPath%\[!] Covers"
attrib -s -h desktop.ini
(
	echo [.ShellClassInfo]
	echo ConfirmFileOp=0
	echo NoSharing=0
	echo IconFile=[!] Covers\cover.ico
	echo IconIndex=0
	echo IconResource=[!] Covers\cover.ico
	echo [ViewState]
	echo Mode=
	echo Vid=
	echo FolderType=Videos
)>desktop.ini
attrib +s +h desktop.ini
ie4uinit -show
attrib +r ..\%par%
goto :EOF

:GUI
call gui
