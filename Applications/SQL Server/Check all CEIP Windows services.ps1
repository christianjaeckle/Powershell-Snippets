Get-Service | Where-Object Name -Like '*TELEMETRY*' | Select-Object -Property Name, StartType, Status
