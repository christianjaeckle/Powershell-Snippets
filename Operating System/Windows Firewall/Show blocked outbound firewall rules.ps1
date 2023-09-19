# Show all blocked and outbound Windows firewall rules
Get-NetFirewallRule -Enabled True -Action Block -Direction Outbound
