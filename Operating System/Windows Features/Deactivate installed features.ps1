Get-WindowsCapability -Online | Where-Object { ($_.State -eq 'Installed') -and ($_.Name -eq '') } | Remove-WindowsCapability -Online
