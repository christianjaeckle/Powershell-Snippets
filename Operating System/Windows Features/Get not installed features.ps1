Get-WindowsCapability -Online | Where-Object { $_.State -ne 'NotPresent' }
