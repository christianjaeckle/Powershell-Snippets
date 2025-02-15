#Requires -RunAsAdministrator

# Change the description of the local user group "TestGroup"
Set-LocalGroup -Name "TestGroup" -Description "Description changed via Powershell"
