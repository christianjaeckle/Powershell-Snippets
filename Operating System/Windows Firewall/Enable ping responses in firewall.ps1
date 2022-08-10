#Requires -RunAsAdministrator

# Enable whole group
Set-NetFirewallRule -DisplayName "File and Printer Sharing (Echo Request – ICMPv4-In)" -Enabled True

# Enable single rules
#Set-NetFirewallRule -Name "FPS-ICMP4-ERQ-In" -Enabled True
#Set-NetFirewallRule -Name "FPS-ICMP4-ERQ-Out" -Enabled True
