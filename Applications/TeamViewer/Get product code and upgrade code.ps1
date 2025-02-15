$TV_ProductC = (Get-CimInstance -ClassName Win32_Product | Where-Object { $_.Name -eq 'TeamViewer' }).IdentifyingNumber
Write-Host $TV_ProductC

$TV_UpgradeC = (Get-CimInstance -ClassName Win32_Property | Where-Object { ($_.ProductCode -eq $TV_ProductC) -and ($_.Caption -eq "UpgradeCode") }).Value
Write-Host $TV_UpgradeC
