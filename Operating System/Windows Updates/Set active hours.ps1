# Set active hours from Windows Update settings

$Key = "HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings"
$Name1 = "ActiveHoursStart"
$Name2 = "ActiveHoursEnd"
$Type1 = "DWord"
$Type2 = "DWord"
$Value1 = "8"
$Value2 = "18"

# Remove key / name / value if exists
Remove-ItemProperty -Path $Key -Name $Name1 -ErrorAction SilentlyContinue

# Add key / name / value
New-ItemProperty -Path $Key -Name $Name1 -PropertyType $Type1 -Value $Value1 -Force

# Remove key / name / value if exists
Remove-ItemProperty -Path $Key -Name $Name2 -ErrorAction SilentlyContinue

# Add key / name / value
New-ItemProperty -Path $Key -Name $Name2 -PropertyType $Type2 -Value $Value2 -Force
