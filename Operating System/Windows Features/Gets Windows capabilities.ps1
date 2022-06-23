# Show optional features
Get-WindowsCapability -Online | Where-Object { $_.State -eq "Installed" } | Select-Object Name
