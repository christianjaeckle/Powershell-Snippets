#Requires -RunAsAdministrator

# Stop "Windows Update" service
Stop-Service wuauserv -Force

# Stop "Hintergrundübertragungsdienst (BITS)" service
Stop-Service bits -Force

# Remove cache directory
Remove-Item -Path "$env:windir\SoftwareDistribution" -Recurse -Force

# Start "Windows Update" service
Start-Service wuauserv -Force

# Start "Hintergrundübertragungsdienst (BITS)" service
Start-Service bits -Force
