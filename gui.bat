<# :

@echo off
setlocal
for /f "delims=" %%i in ('ps.lnk -NoProfile "iex (${%~f0} | out-string)"') do (
	rem echo %%~i
)
goto :EOF

: #>

Add-Type -AssemblyName System.Windows.Forms
$mainForm = New-Object Windows.Forms.Form
$mainForm.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterScreen;
$mainForm.Icon = '[!] Covers\cover.ico'
$mainForm.Text = 'Change Folder Icon'
$mainForm.Width = 600
$mainForm.Height = 400
[void]$mainForm.ShowDialog()
