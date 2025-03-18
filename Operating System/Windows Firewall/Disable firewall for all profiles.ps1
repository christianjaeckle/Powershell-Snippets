#Requires -RunAsAdministrator

# Disable Windows firewall for all profiles
Set-NetFirewallProfile -All -Enabled False

# OR
Set-NetFirewallProfile -Profile Domain, Public, Private -Enabled False
