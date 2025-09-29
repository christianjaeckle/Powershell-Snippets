# Model
Get-CimInstance -Namespace root/WMI -ClassName WmiMonitorID | ForEach-Object { ($_.ProductCodeID | ForEach-Object { [char]$_} ) -join ''}
