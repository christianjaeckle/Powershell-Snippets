Get-SqlInstance -ServerInstance @('localhost') | Invoke-Sqlcmd -HostName { Where-Object -Property 'Instance Name' } -Query 'SELECT @@SERVERNAME AS instance,1 AS Connected'
