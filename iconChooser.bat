<# : Start

@echo off
setlocal
for /f "delims=" %%i in ('powershell -noprofile "iex (${%~f0} | out-string)"') do (
	echo %%~i
)
goto :EOF

: End #>

add-type -assemblyname System.Windows.Forms
$f = new-object Windows.Forms.OpenFileDialog
$f.InitialDirectory = pwd
$f.Filter = "Icon File (*.ico)|*.ico"
$f.ShowHelp = $true
$f.Multiselect = $false
[void]$f.ShowDialog()
if ($f.Multiselect) { $f.FileNames } else { $f.FileName }
