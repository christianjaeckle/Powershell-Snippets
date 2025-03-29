if ((Get-CimInstance -ClassName 'Win32_ComputerSystem').HypervisorPresent -eq $true) {
    Write-Output 'Hyper-V is available.'
}
else {
    Write-Output 'Hyper-V is not available.'
}
