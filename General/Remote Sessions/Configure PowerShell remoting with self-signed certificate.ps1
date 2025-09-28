# ON REMOTE DEVICE (The device you want to connect to)

## Create new self-signed certificate
$Cert = New-SelfSignedCertificate -CertstoreLocation Cert:\LocalMachine\My -DnsName $Env:ComputerName

## Export cert to file
Export-Certificate -Cert $Cert -FilePath (Join-Path -Path $Env:Temp -ChildPath 'Cert\PoShRemoting')

## Enable PowerShell remoting
Enable-PSRemoting -SkipNetworkProfileCheck -Force

## Add https listener
New-Item -Path WSMan:\LocalHost\Listener -Transport https -Address * -CertificateThumbPrint $Cert.Thumbprint –Force

## Add Windows firewall rule
New-NetFirewallRule -DisplayName "Windows Remote Management (HTTPS-In)" -Name "Windows Remote Management (HTTPS-In)" -Profile Any -LocalPort 5986 -Protocol TCP

## Remove http listener
Get-ChildItem WSMan:\Localhost\listener | Where -Property Keys -eq 'Transport=http' | Remove-Item -Recurse

## Disable Windows firewall rule for http
Disable-NetFirewallRule -DisplayName "Windows Remote Management (HTTP-In)"

## Test
Enter-PSSession -ComputerName $Env:ComputerName -UseSSL -SkipCACheck -Credential (Get-Credential)


# LOCAL DEVICE (From where you are connecting)

## Import cert file
Import-Certificate -Filepath (Join-Path -Path $Env:Temp -ChildPath 'Cert\PoShRemoting') -CertStoreLocation "Cert:\LocalMachine\Root"
