#Requires -RunAsAdministrator

# Enable Windows firewall for "Public" profile
Set-NetFirewallProfile -Profile Public -Enabled True

# Disable Windows firewall for "Private" profile
Set-NetFirewallProfile -Profile Private -Enabled False
