$JavaStartDate = Get-Date -Date "01.01.1970"
$CurrentDate = Get-Date

# Calculate, round and output
[System.Math]::Round((New-TimeSpan -Start $JavaStartDate -End $CurrentDate).TotalSeconds)
