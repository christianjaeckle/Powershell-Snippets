$ComputerName = $env:COMPUTERNAME

Get-Printer -ComputerName $ComputerName | ForEach-Object {
    Get-PrintJob -PrinterName $_.Name -ComputerName $ComputerName
 }
