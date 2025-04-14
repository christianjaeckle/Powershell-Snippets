# Change folder owner recursively
$Acc_Principle = New-Object System.Security.Principal.NTAccount('Domain', 'User')

Get-ChildItem -Path 'X:\Folder' -Recurse | Get-Acl | Where-Object { $_.Owner -ne $Acc_Principle } | ForEach-Object { $_.SetOwner($Acc_Principle); $_ } | Set-Acl
