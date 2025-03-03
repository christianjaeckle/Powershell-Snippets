# Check if feature is already installed
Get-WindowsFeature Windows-Server-Backup

# Install feature
Install-WindowsFeature Windows-Server-Backup -IncludeManagementTools
