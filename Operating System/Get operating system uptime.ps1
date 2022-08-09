(Get-Date) - (Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object -ExpandProperty LastBootUpTime)

# OR

function Get-SystemUptime {
    $OS_Info = Get-WmiObject Win32_OperatingSystem
    $OS_Info.ConvertToDateTime($OS_Info.LastBootupTime)
}

Get-SystemUptime
