$MACAddress = "00:AA:23:A3:E3:51"

# Transform given MACaddress
$MACByteArray = $MACAddress -split "[:-]" | ForEach-Object { [Byte] "0x$_" }
[Byte[]] $MagicPacket = (, 0xFF * 6) + ($MACByteArray * 16)

# Create UDP client
$UdpClient = New-Object System.Net.Sockets.UdpClient
$UdpClient.Connect(([System.Net.IPAddress]::Broadcast), 7)
$UdpClient.Send($MagicPacket, $MagicPacket.Length)
$UdpClient.Close()
