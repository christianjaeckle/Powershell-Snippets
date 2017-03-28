Get-WindowsOptionalFeature -Online | Where-Object { $_.State -eq "Enabled" }
