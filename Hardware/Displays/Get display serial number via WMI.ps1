# Serial number
Get-CimInstance -Namespace root/WMI -ClassName WmiMonitorID | ForEach-Object { ($_.SerialNumberID | ForEach-Object { [char]$_} ) -join ''}
