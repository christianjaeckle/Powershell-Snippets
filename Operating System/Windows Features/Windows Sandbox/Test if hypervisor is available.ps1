if ((Get-CimInstance -ClassName 'Win32_ComputerSystem').HypervisorPresent -eq $true) {
    Write-Output 'Hypervisor is available.'
}
else {
    Write-Output 'Hypervisor is not available.'
}
