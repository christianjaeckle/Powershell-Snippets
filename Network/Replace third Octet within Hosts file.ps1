# Define Octets
[int]$FirstOctet = 192
[int]$SecondOctet = 168
[string]$HostsPath = "$env:SystemRoot\System32\drivers\etc\hosts"

# Read hosts file
$HostsContent = Get-Content -Path $HostsPath

# Search and replace with regular expression and fix address
#$HostsContent -Replace "192\.168\.\d{1,3}\.(\d{1,3})", '192.168.99.$1'

# Search and replace with regular expression and address from variable
$HostsContent -Replace "$FirstOctet\.$SecondOctet\.\d{1,3}\.(\d{1,3})", '192.168.10.$1'
