#Requires -RunAsAdministrator

Get-LocalUser | Where-Object { $_.Enabled -eq $true } | Add-LocalGroupMember -Group "Remote Desktop Users"
