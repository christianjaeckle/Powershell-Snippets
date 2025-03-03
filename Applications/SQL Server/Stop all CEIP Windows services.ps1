Get-Service | Where-Object Name -Like '*TELEMETRY*' | Where-Object status -eq 'Running' | Stop-Service
