#Requires -Version 3.0

$IPAddr = Invoke-RestMethod -Uri http://checkip.amazonaws.com/
Write-Host $IPAddr

Invoke-RestMethod -Uri "http://geoip.nekudo.com/api/$IPAddr" | Select-Object -ExpandProperty Country -Property City, IP, Location 
