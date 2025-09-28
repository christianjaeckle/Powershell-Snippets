# Get all installed third-party drivers
Get-WindowsDriver -Online | Select-Object -Property ClassName, ProviderName, Driver, Date, Version, BootCritical, OriginalFileName | Sort-Object -Property ProviderName
