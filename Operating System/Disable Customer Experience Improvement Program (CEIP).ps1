# Disable scheduled tasks of CEIP
Get-ScheduledTask -TaskPath "\Microsoft\Windows\Customer Experience Improvement Program\" | Disable-ScheduledTask
 
# Deactivate via Registry
Set-ItemProperty -Path "HKLM:\Software\Microsoft\SQMClient\Windows\CEIPEnable" -name "CEIPEnabled" -Value 0
