Get-AppxPackage | Where-Object { $_.Publisher -notlike "*Microsoft*" }
