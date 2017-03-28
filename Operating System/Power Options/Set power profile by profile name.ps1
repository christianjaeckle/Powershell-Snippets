# Set power profile to performance profile (EN)
Get-WmiObject -Namespace root\cimv2\power -Class Win32_Powerplan -Filter "ElementName='High performance'" | Invoke-WmiMethod -Name Activate

# Set power profile to performance profile (DE)
Get-WmiObject -Namespace root\cimv2\power -Class Win32_Powerplan -Filter "ElementName='Höchstleistung'" | Invoke-WmiMethod -Name Activate
