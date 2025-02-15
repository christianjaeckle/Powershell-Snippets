# DNS
Resolve-DnsName -Name router.teamviewer.com
1..16 | ForEach-Object { Resolve-DnsName -Name router$_.teamviewer.com -DnsOnly }
Resolve-DnsName -Name master.teamviewer.com
1..6 | ForEach-Object { Resolve-DnsName -Name master$_.teamviewer.com -DnsOnly }

# Ping
Test-Connection -ComputerName ping3.teamviewer.com -Count 1
Test-Connection -ComputerName router.teamviewer.com -Count 1
Test-Connection -ComputerName master.teamviewer.com -Count 1
Test-Connection -ComputerName dl.teamviewer.com -Count 1
Test-Connection -ComputerName go.teamviewer.com -Count 1
Test-Connection -ComputerName get.teamviewer.com -Count 1
Test-Connection -ComputerName client.teamviewer.com -Count 1
Test-Connection -ComputerName configdl.teamviewer.com -Count 1
Test-Connection -ComputerName login.teamviewer.com -Count 1
Test-Connection -ComputerName webapi.teamviewer.com -Count 1

# Tracert
Test-NetConnection -ComputerName ping3.teamviewer.com -Tracerout
Test-NetConnection -ComputerName router.teamviewer.com -Tracerout
Test-NetConnection -ComputerName master.teamviewer.com -Tracerout
Test-NetConnection -ComputerName dl.teamviewer.com -Tracerout
Test-NetConnection -ComputerName go.teamviewer.com -Tracerout
Test-NetConnection -ComputerName get.teamviewer.com -Tracerout
Test-NetConnection -ComputerName client.teamviewer.com -Tracerout
Test-NetConnection -ComputerName configdl.teamviewer.com -Tracerout
Test-NetConnection -ComputerName login.teamviewer.com -Tracerout
Test-NetConnection -ComputerName webapi.teamviewer.com -Tracerout

# Telnet
Test-NetConnection -ComputerName ping3.teamviewer.com -Port 80 -InformationLevel Quiet
Test-NetConnection -ComputerName ping3.teamviewer.com -Port 443 -InformationLevel Quiet
Test-NetConnection -ComputerName ping3.teamviewer.com -Port 5938 -InformationLevel Quiet
Test-NetConnection -ComputerName router.teamviewer.com -Port 80 -InformationLevel Quiet
Test-NetConnection -ComputerName router.teamviewer.com -Port 443 -InformationLevel Quiet
Test-NetConnection -ComputerName router.teamviewer.com -Port 5938 -InformationLevel Quiet
Test-NetConnection -ComputerName master.teamviewer.com -Port 80 -InformationLevel Quiet
Test-NetConnection -ComputerName master.teamviewer.com -Port 443 -InformationLevel Quiet
Test-NetConnection -ComputerName master.teamviewer.com -Port 5938 -InformationLevel Quiet
Test-NetConnection -ComputerName dl.teamviewer.com -Port 80 -InformationLevel Quiet
Test-NetConnection -ComputerName dl.teamviewer.com -Port 443 -InformationLevel Quiet
Test-NetConnection -ComputerName go.teamviewer.com -Port 80 -InformationLevel Quiet
Test-NetConnection -ComputerName go.teamviewer.com -Port 443 -InformationLevel Quiet
Test-NetConnection -ComputerName get.teamviewer.com -Port 80 -InformationLevel Quiet
Test-NetConnection -ComputerName get.teamviewer.com -Port 443 -InformationLevel Quiet
Test-NetConnection -ComputerName client.teamviewer.com -Port 80 -InformationLevel Quiet
Test-NetConnection -ComputerName client.teamviewer.com -Port 443 -InformationLevel Quiet
Test-NetConnection -ComputerName configdl.teamviewer.com -Port 80 -InformationLevel Quiet
Test-NetConnection -ComputerName configdl.teamviewer.com -Port 443 -InformationLevel Quiet
Test-NetConnection -ComputerName login.teamviewer.com -Port 80 -InformationLevel Quiet
Test-NetConnection -ComputerName login.teamviewer.com -Port 443 -InformationLevel Quiet
Test-NetConnection -ComputerName webapi.teamviewer.com -Port 80 -InformationLevel Quiet
Test-NetConnection -ComputerName webapi.teamviewer.com -Port 443 -InformationLevel Quiet
