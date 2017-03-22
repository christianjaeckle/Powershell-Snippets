$objJSON = Get-Content -Path "$env:USERPROFILE\Desktop\\Example.json"
$objJSON | ConvertFrom-Json | ConvertTo-Json | Out-File -FilePath "$env:USERPROFILE\Desktop\Example-Pretty.json"
