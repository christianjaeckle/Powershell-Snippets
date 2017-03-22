#Requires -Version 3.0

$IPAddr = Invoke-RestMethod -Uri http://checkip.amazonaws.com/
Write-Host $IPAddr
