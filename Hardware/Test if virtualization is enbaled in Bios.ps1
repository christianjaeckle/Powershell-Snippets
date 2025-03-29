if ((Get-CimInstance -ClassName 'Win32_ComputerSystem').VirtualizationFirmwareEnabled -eq $true) {
    Write-Output 'The virtualization capabilities are enabled.'
}
else {
    Write-Output 'The virtualization capabilities are disabled!'
}
