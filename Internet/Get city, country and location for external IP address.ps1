#Requires -Version 3.0

$IPAddr = Invoke-RestMethod -Uri http://checkip.amazonaws.com/

(Invoke-RestMethod -Uri "http://freegeoip.net/xml/$IPAddr").Response
