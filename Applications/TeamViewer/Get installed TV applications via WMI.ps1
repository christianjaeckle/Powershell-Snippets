Get-WmiObject -Class Win32_Product | Select-Object IdentifyingNumber, Name, LocalPackage | Where-Object { $_.Name -like 'TeamViewer*' }
