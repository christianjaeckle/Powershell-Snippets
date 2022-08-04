Get-Service | foreach-object { if ($_.Status -eq "Stopped") { Write-Host -f red $_.Name $_.Status}` else { Write-Host -f green $_.Name $_.Status }}
