# Get all certificates which will expire in 30 days and which are older than 60 days
Get-ChildItem -Path Cert:\ -Recurse | Where-Object { ($_.NotAfter -le ((Get-Date).AddDays(30))) -and ($_.NotAfter -gt ((Get-Date).AddDays(-60))) } | Select-Object Subject, SerialNumber, NotAfter
