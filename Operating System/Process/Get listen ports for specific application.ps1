# Get listen port for specific application
$App = 'MyApp'

Get-NetTCPConnection -OwningProcess ((Get-Process -Name $App).Id) -State Listen | Select-Object LocalAddress, LocalPort, RemoteAddress, RemotePort, State, OwningProcess | Format-Table -AutoSize
