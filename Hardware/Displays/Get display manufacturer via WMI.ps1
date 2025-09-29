# Manufacturer
Get-CimInstance -Namespace root/WMI -ClassName WmiMonitorID | ForEach-Object { ($_.ManufacturerName | ForEach-Object { [char]$_} ) -join ''}
