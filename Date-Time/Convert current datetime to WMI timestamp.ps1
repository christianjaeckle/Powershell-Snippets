$datDate = Get-Date
$datDTMFDate = [System.Management.ManagementDateTimeConverter]::ToDmtfDateTime($datDate)
Write-Host $datDate
Write-Host $datDTMFDate
