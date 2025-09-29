[string]$USB_Path = 'F:\'
[string]$USB_DriverPath = (Join-Path -Path $USB_Path -ChildPath "_Drivers\$env:ComputerName")

# Create folder
New-Item -ItemType Directory -Path $USB_DriverPath | Out-Null

# Export drivers
Export-WindowsDriver -Destination $USB_DriverPath -Online
