# Get current ACLs
$Acl = Get-Acl -Path 'D:\'

# Define new / additional ACL (current user, full access, allow)
$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule($env:UserName, 'FullControl', 'Allow')

# Add, not replace existing rules
$Acl.RemoveAccessRule($AccessRule)

# Add new / additional ACL to object
$Acl | Set-Acl -Path 'D:\'
