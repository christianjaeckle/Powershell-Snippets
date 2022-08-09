Get-CimInstance -ClassName Win32_StartupCommand | Select-Object -Property Command, Description, User, Location
