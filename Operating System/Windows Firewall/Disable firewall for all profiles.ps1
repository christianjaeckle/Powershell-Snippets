#Requires -RunAsAdministrator

# Disable Windows firewall for all profiles
Set-NetFirewallProfile -All -Enabled False
