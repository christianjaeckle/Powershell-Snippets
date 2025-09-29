$ConnectionTypes = @{
    '0'          = 'VGA'
    '4'          = 'DVI'
    '5'          = 'HDMI'
    '10'         = 'DisplayPort (external)'
    '11'         = 'DisplayPort (internal)'
    '12'         = 'Unified Display Interface'
    '13'         = 'Unified Display Interface (embedded)'
    '16'         = 'Internal'
    '2147483648' = 'Internal'
}

Get-CimInstance -Namespace root/WMI -ClassName WmiMonitorID | ForEach-Object {
    $TFT_Instance = $_.InstanceName
    $TFT_Manufacturer = [System.Text.Encoding]::ASCII.GetString($_.ManufacturerName).Trim(0x00)
    $TFT_Model = [System.Text.Encoding]::ASCII.GetString($_.UserFriendlyName).Trim(0x00)
    $TFT_SerialNumber = [System.Text.Encoding]::ASCII.GetString($_.SerialNumberID).Trim(0x00)

    $ConnectionType = (Get-CimInstance -Namespace root/WMI -ClassName WmiMonitorConnectionParams | Where-Object { $_.InstanceName -like $TFT_Instance }).VideoOutputTechnology
    [PSCustomObject]@{
        InstanceName   = $TFT_Instance
        Manufacturer   = $TFT_Manufacturer
        Model          = $TFT_Model
        SerialNumber   = $TFT_SerialNumber
        ConnectionType = $ConnectionTypes."$ConnectionType"
    }
}
