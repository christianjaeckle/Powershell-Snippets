1..10 | ForEach-Object { Write-Host $_ }

# OR
Get-ChildItem -Path $PSScriptRoot | ForEach-Object { Write-Host $_.Name }

# OR
[int]$Temp = 10
3..8 | ForEach-Object { $Temp += $_ }
Write-Host $Temp
