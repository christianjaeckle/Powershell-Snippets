Get-PnpDevice -Class Mouse -PresentOnly | Get-PnpDeviceProperty

# OR more specific
Get-PnpDevice -Class Mouse -FriendlyName 'HID-konforme Maus' -PresentOnly | Get-PnpDeviceProperty
