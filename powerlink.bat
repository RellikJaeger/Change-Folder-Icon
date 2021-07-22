<# :

@echo off
setlocal EnableDelayedExpansion
set ps="C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe"
set cover="[^!] Covers\cover.ico"
echo !cover!
attrib -s -h !cover!
for /f "delims=" %%i in ('Powershell -NoProfile "iex (${%~f0} | out-string)"') do (set x=0)
endlocal
attrib +s +h "[!] Covers"
ie4uinit -show
goto :EOF

: #>

$Shell = New-Object -ComObject ("WScript.Shell")
$Shortcut = $Shell.CreateShortcut("ps.lnk")
$Shortcut.TargetPath = "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe"
$Shortcut.IconLocation = "$pwd\[!] Covers\cover.ico, 0"
$Shortcut.Save()
