#Requires -Version 5.1
#Requires -PSEdition Desktop
#Requires -RunAsAdministrator

Set-StrictMode -Version Latest

Install-Script -Name 'WinGet-Install' -Scope AllUsers -Confirm:$false -Force
Winget-Install -Force
