#Requires -RunAsAdministrator

Get-LocalUser | Where-Object { ($_.LastLogon -ne $null) -or ($_.LastLogon -ne '') -and ($_.LastLogon -le ((Get-Date).AddDays(-180))) -and ($_.Enabled -eq $true) } | Disable-LocalUser -WhatIf
