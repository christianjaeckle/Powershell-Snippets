# Removes the local computer from an AD domain and puts it into workgroup
Remove-Computer -ComputerName Localhost -UnJoinDomainCredential (Get-Credential) -WorkgroupName "Workgroup" -Force -Restart
