# Read and export feature configuration
Get-WindowsOptionalFeature -Online | Where-Object { $_.State -eq "Enabled" } | Export-Clixml -Path "$env:userprofile\desktop\Feature - Backup.xml"
