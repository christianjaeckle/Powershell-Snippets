# Get a list of all installed drivers via WMI
Get-CimInstance -ClassName 'Win32_PnPSignedDriver' | Select-Object -Property DeviceClass, Manufacturer, DeviceName, DriverVersion, DriverDate, InfName
