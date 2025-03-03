Get-Service | Where-Object Name -Like '*TELEMETRY*' | Set-Service -StartMode Disabled
