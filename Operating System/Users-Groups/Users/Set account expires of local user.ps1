[datetime]$ExpDate = (Get-Date).AddMonths(10)
Set-LocalUser -Name Test -AccountExpires $ExpDate
