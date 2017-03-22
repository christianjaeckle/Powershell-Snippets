(Get-Process | Format-Table Name, @{ label = "Running Since (Minutes)"; expression={ [System.Math]::Round(((Get-Date) - $_.StartTime).TotalMinutes) }})
