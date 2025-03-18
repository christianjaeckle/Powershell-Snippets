# Add Windows firewall rules for SQL Server default instance
New-NetFirewallRule -Direction Inbound -Action Allow -Enabled True -Profile Domain, Private -Protocol TCP -LocalPort 1433 -Group "SQL-Server" -DisplayName "SQL-Server - Default Instance - Inbound" -Description "SQL-Server, Default Instance, Inbound, TCP 1433" -Program "C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Binn\sqlservr.exe"
New-NetFirewallRule -Direction Inbound -Action Allow -Enabled False -Profile Domain, Private -Protocol UDP -LocalPort 1434 -Group "SQL-Server" -DisplayName "SQL-Server - Default Instance - Browser - Inbound" -Description "SQL-Server, Default Instance, Inbound, Browser, UDP 1434" -Program "C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Binn\sqlservr.exe"

# SQL Analysis Ports
New-NetFirewallRule -Direction Inbound -Action Allow -Enabled False -Profile Domain, Private -Protocol TCP -LocalPort 2383 -Group "SQL-Server" -DisplayName 'SQL-Server - Analysis Services'
New-NetFirewallRule -Direction Inbound -Action Allow -Enabled False -Profile Domain, Private -Protocol TCP -LocalPort 2382 -Group "SQL-Server" -DisplayName 'SQL-Server - Browser'

# SQL Special
New-NetFirewallRule -Direction Inbound -Action Allow -Enabled False -Profile Domain, Private -Protocol TCP -LocalPort 4022 -Group "SQL-Server" -DisplayName 'SQL Service Broker'
New-NetFirewallRule -Direction Inbound -Action Allow -Enabled False -Profile Domain, Private -Protocol TCP -LocalPort 135 -Group "SQL-Server" -DisplayName 'SQL Debugger/RPC'
