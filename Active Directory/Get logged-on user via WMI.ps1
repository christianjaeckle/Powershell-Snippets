(Get-WmiObject -Class Win32_ComputerSystem -ComputerName $env:ComputerName).UserName
