# Name of the network adapter
$netAdapterName = "Ethernet"

# Disable IPv6
Disable-NetAdapterBinding -InterfaceAlias $netAdapterName -ComponentID ms_tcpip6
