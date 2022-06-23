$PCInfo = Get-WMIObject -Query 'Select * from Win32_ComputerSystem' | Select-Object -Property Manufacturer, Model
Write-Host $PCInfo
             
if ($PCInfo.Manufacturer -eq 'LENOVO') {
  $PCInfo = Get-WMIObject -Query 'Select * from Win32_ComputerSystemProduct' | Select-Object -Property Vendor, Version  
  Write-Host $PCInfo
}
