Set-NetFirewallRule -DisplayName "Remotedesktop - Benutzermodus (TCP eingehend)" -Enabled True

# Or if you would like to allow the whole group
Enable-NetFirewallRule -DisplayGroup "Remotedesktop"
