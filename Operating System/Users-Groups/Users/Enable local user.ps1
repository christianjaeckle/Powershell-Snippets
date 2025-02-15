#Requires -RunAsAdministrator

Enable-LocalUser -Name Test

# OR
Get-LocalUser -Name Test | Enable-LocalUser

# OR by SID
Enable-LocalUser -SID "S-1xxx"
