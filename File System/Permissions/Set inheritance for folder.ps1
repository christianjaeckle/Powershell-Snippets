$Acl = Get-Acl -Path 'D:\'

# First param: block ($true = yes) inheritance from parent
# Second param: keep ($true) inherited permissions or delete ($false) them
$Acl.SetAccessRuleProtection($true, $false)

$Acl | Set-Acl -Path 'D:\'
