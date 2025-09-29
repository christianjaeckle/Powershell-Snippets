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

    $ConnectionType = (Get-CimInstance -Namespace root/WMI -ClassName WmiMonitorConnectionParams | Where-Object { $_.InstanceName -like $TFT_Instance }).VideoOutputTechnology
    [PSCustomObject]@{
        InstanceName   = $TFT_Instance
        ConnectionType = $ConnectionTypes."$ConnectionType"
    }
}
