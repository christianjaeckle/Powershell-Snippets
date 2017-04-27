# Input
[long]$lngGroesseInMB = Read-Host "Enter size of files in MB (without comma / point)"
[long]$lngTransfRateInMB = Read-Host "Transfer sped in MB per second (without comma / point)"

# Calculate size
[long]$lngGroesseInGB = $lngGroesseInMB / 1024

# Calculate duration
[long]$lngTransfDauerInSek = $lngGroesseInMB / $lngTransfRateInMB
[long]$lngTransfDauerInMin = $lngTransfDauerInSek / 60

# Output
Write-Host "The transfer of $lngGroesseInMB MB ($lngGroesseInGB GB) will take $lngTransfDauerInSek seconds ($lngTransfDauerInMin Minutes)."
