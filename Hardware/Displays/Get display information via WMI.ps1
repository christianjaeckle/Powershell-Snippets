# Manufacturer
Get-CimInstance -Namespace root/WMI -ClassName WmiMonitorID | ForEach-Object { ($_.ManufacturerName | ForEach-Object { [char]$_} ) -join ''}

# Model
Get-CimInstance -Namespace root/WMI -ClassName WmiMonitorID | ForEach-Object { ($_.ProductCodeID | ForEach-Object { [char]$_} ) -join ''}

# Serial number
Get-CimInstance -Namespace root/WMI -ClassName WmiMonitorID | ForEach-Object { ($_.SerialNumberID | ForEach-Object { [char]$_} ) -join ''}
