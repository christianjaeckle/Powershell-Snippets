$PS_Path = 'C:\WINDOWS\system32\windowspowershell\v1.0\powershell.exe -NoExit'
$CM_Text = 'Öffne mit PowerShell'

# Folders
New-Item HKLM:\SOFTWARE\Classes\Directory\shell\OpenPowerShellHere -force 
Set-Item HKLM:\SOFTWARE\Classes\Directory\shell\OpenPowerShellHere $CM_Text
New-item HKLM:\SOFTWARE\Classes\Directory\shell\OpenPowerShellHere\command -force
Set-item HKLM:\SOFTWARE\Classes\Directory\shell\OpenPowerShellHere\command "$PS_Path Set-Location '%L'"

# Folders background
New-Item HKLM:\SOFTWARE\Classes\Directory\Background\shell\OpenPowerShellHere -force 
Set-Item HKLM:\SOFTWARE\Classes\Directory\Background\shell\OpenPowerShellHere $CM_Text
New-item HKLM:\SOFTWARE\Classes\Directory\Background\shell\OpenPowerShellHere\command -force
Set-item HKLM:\SOFTWARE\Classes\Directory\Background\shell\OpenPowerShellHere\command "$PS_Path"

# Drives
New-Item HKLM:\SOFTWARE\Classes\Drive\shell\OpenPowerShellHere -force 
Set-Item HKLM:\SOFTWARE\Classes\Drive\shell\OpenPowerShellHere $CM_Text
New-item HKLM:\SOFTWARE\Classes\Drive\shell\OpenPowerShellHere\command -force
Set-item HKLM:\SOFTWARE\Classes\Drive\shell\OpenPowerShellHere\command "$PS_Path Set-Location '%L'"
