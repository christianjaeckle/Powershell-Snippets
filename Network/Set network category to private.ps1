# For one specific connection
Set-NetConnectionProfile –InterfaceAlias "Ethernet" –NetworkCategory Private

# For all connections
Get-NetConnectionProfile | Set-NetConnectionProfile -NetworkCategory Private
