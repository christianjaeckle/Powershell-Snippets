$ActiveDrivers = (Get-PnpDeviceProperty -InputObject (Get-PnpDevice -PresentOnly) -KeyName DEVPKEY_Device_DriverInfPath | Select-Object -Property Data -Unique).Data
$StoredDrivers = Get-WindowsDriver -Online
$DriversToRemove = $StoredDrivers | Where-Object -Property Driver -NotIn $ActiveDrivers
