#Requires -Version 4

Get-ScheduledTask | Select-Object TaskName,Author, @{ "n" = "CreationDate"; "e" = { [datetime]$_.Date } }
