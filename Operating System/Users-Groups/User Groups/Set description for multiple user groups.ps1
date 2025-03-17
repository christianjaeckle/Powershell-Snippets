Get-LocalGroup | Where-Object { $_.Name -like "*_ToChange" } | foreach {
  Set-LocalGroup -Name $_.Name -Description 'New description'
}
