# Define needed variables
$IPProtocol = "IPv4"
$AdapterName = "Ethernet"
$IPAddress = "10.60.0.51"
$SubNetMaskInBits = 24 # 255.255.255.0
$DefaultGateway = "10.60.0.1"
$DNSServer = "10.60.0.11"

# Get only active adapter with specific name
Write-Verbose "Get only active adapters."
$ActiveAdapter = Get-NetAdapter -Name $AdapterName | ? { $_.Status -eq "Up" }

# Remove existing IP address from the adapter
If (($ActiveAdapter | Get-NetIPConfiguration).IPv4Address.IPAddress) {
    Write-Verbose "Remove existing IP address."
    $ActiveAdapter | Remove-NetIPAddress -AddressFamily $IPProtocol -Confirm:$false
}

# Remove existing standard gateway from the adapter
If (($ActiveAdapter | Get-NetIPConfiguration).Ipv4DefaultGateway) {
    Write-Verbose "Remove existing standard gateway."
    $ActiveAdapter | Remove-NetRoute -AddressFamily $IPProtocol -Confirm:$false
}

# Configure the IP address and default gateway
Write-Verbose "Configure the IP address and default gateway."
$ActiveAdapter | New-NetIPAddress -IPAddress $IPAddress -DefaultGateway $DefaultGateway -AddressFamily $IPProtocol -PrefixLength $SubNetMaskInBits

# Configure the DNS server
Write-Verbose "Configure the DNS server."
$ActiveAdapter | Set-DnsClientServerAddress -ServerAddresses $DNSServer
