$IPProtocol = "IPv4"

# Get only active adapters
Write-Verbose "Get only active adapters."
$ActiveAdapters = Get-NetAdapter | ? { $_.Status -eq "Up" }

# Get IPv4 interfaces
Write-Verbose "Get IPv4 interfaces."
$IP4Interfaces = $ActiveAdapters | Get-NetIPInterface -AddressFamily $IPProtocol

If ($IP4Interfaces.Dhcp -eq "Disabled") {
    Write-Verbose "DHCP is currently disabled."

    # Remove existing standard gateway
    If (($IP4Interfaces | Get-NetIPConfiguration).Ipv4DefaultGateway) {
        Write-Verbose "Remove existing standard gateway."
        $IP4Interfaces | Remove-NetRoute -Confirm:$false
    }
    
    # Enable DHCP
    Write-Verbose "Enable DHCP."
    $IP4Interfaces | Set-NetIPInterface -DHCP Enabled
    
    # Set DNS Servers to automatic
    Write-Verbose "Set DNS Servers to automatic"
    $IP4Interfaces | Set-DnsClientServerAddress -ResetServerAddresses
}
else {
    Write-Verbose "DHCP is currently enabled."
}
