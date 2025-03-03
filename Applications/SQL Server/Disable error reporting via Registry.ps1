Get-ChildItem 'HKLM:\SOFTWARE\Microsoft\Microsoft SQL Server' -Recurse | Where-Object -Property Property -eq 'EnableErrorReporting' | Set-ItemProperty -Name 'EnableErrorReporting' -Value 0
Get-ChildItem 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\Microsoft SQL Server' -Recurse | Where-Object -Property Property -eq 'EnableErrorReporting' | Set-ItemProperty -Name 'EnableErrorReporting' -Value 0
