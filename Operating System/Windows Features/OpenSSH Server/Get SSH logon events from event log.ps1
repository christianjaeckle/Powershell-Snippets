Get-WinEvent -LogName 'OpenSSH/Operational' | Select-Object -First 10 | Format-List
