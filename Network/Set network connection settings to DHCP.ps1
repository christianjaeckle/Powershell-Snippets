$IPProtocol = "IPv4"
$AdapterName = "Ethernet"

# Get only active adapter with name "Ethernet"
Write-Verbose "Get only active adapter with name '$AdapterName'."
$ActiveAdapter = Get-NetAdapter -Name $AdapterName | ? { $_.Status -eq "Up" }

# Get IPv4 interfaces
Write-Verbose "Get IPv4 interface."
$IP4Interface = $ActiveAdapter | Get-NetIPInterface -AddressFamily $IPProtocol

If ($IP4Interface.Dhcp -eq "Disabled") {
    Write-Verbose "DHCP is currently disabled."

    # Remove existing standard gateway
    If (($IP4Interface | Get-NetIPConfiguration).Ipv4DefaultGateway) {
        Write-Verbose "Remove existing standard gateway."
        $IP4Interface | Remove-NetRoute -Confirm:$false
    }
    
    # Enable DHCP
    Write-Verbose "Enable DHCP."
    $IP4Interface | Set-NetIPInterface -DHCP Enabled
    
    # Set DNS Servers to automatic
    Write-Verbose "Set DNS Servers to automatic"
    $IP4Interface | Set-DnsClientServerAddress -ResetServerAddresses
}
else {
    Write-Verbose "DHCP is currently enabled."
}
