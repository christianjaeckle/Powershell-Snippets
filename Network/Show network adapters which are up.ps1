(Get-NetAdapter | Where-Object { $_.Status -eq "Up" }).Name
