#Requires -RunAsAdministrator

Disable-LocalUser -Name Test

# Or
Get-LocalUser -Name Test | Disable-LocalUser
