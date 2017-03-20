# Set active hours from Windows Update settings

$Key = "HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings"
$Type = "DWord"
$From = "8"
$To = "18"
$Name1 = "ActiveHoursStart"
$Name2 = "ActiveHoursEnd"

# Remove key / name / value if exists
Remove-ItemProperty -Path $Key -Name $Name1 -ErrorAction SilentlyContinue

# Add key / name / value
New-ItemProperty -Path $Key -Name $Name1 -PropertyType $Type -Value $From -Force

# Remove key / name / value if exists
Remove-ItemProperty -Path $Key -Name $Name2 -ErrorAction SilentlyContinue

# Add key / name / value
New-ItemProperty -Path $Key -Name $Name2 -PropertyType $Type -Value $To -Force
