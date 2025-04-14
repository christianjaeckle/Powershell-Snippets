# Get current ACLs from folder
$Fol_Acl = Get-Acl 'X:\Folder'

# Get user and define as owner
$Acc_Principle = New-Object System.Security.Principal.Ntaccount("DOMAIN.USERNAME")
$Fol_Acl.SetOwner($Acc_Principle)

# Set new ACLs for folder
$Fol_Acl | Set-Acl 'X:\Folder'
