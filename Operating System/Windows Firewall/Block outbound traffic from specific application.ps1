#Requires -RunAsAdministrator

New-NetFirewallRule -Program $MyApplicationPath -Action Block -Profile All -DisplayName MyApplicationDisplayName -Description MyApplicationDescription -Direction Outbound
