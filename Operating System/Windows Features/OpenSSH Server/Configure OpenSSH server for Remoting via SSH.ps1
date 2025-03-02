# Install the OpenSSH Server
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0

# Start the sshd service automatically
Set-Service -Name sshd -StartupType 'Automatic'

# Confirm the Firewall rule is configured (automatically created by setup)
if (!(Get-NetFirewallRule -Name 'PowerShell-Remoting-SSH' -ErrorAction SilentlyContinue | Select-Object Name, Enabled)) {
    Write-Output "Firewall Rule 'PowerShell Remoting via SSH' does not exist, creating it..."
	
    New-NetFirewallRule -Name 'PowerShell-Remoting-SSH' -DisplayName 'PowerShell Remoting via SSH' -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 22
} else {
    Write-Output "Firewall rule 'PowerShell Remoting via SSH' has been created and exists."
}

# Set default shell to version 7
New-ItemProperty -Path "HKLM:\SOFTWARE\OpenSSH" -Name DefaultShell -Value "C:\Program Files\PowerShell\7\pwsh.exe" -PropertyType String -Force

# Add to SSH config ($env:ProgramData\ssh\sshd_config) manually
Notepad $env:ProgramData\ssh\sshd_config
#PasswordAuthentication yes

# Start the sshd service
Start-Service sshd

# Test for listing port
Test-NetConnection -ComputerName Localhost -Port 22
