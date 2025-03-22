# Iterate throug all local user groups
foreach ($UserGroup in (Get-LocalGroup)) {
  # Iterate through all users of the local user group
  foreach ($UserGroupMember in (Get-LocalGroupMember -Group $UserGroup)) {
    $MemberArgs = @{
      MemberType = 'NoteProperty'
      Name       = 'GroupName'
      Value      = $UserGroup.Name
      PassThru   = $true
    }
    
    $Properties = @(
      'GroupName', 'Name', 'PrincipalSource', 'ObjectClass'
    )

    $UserGroupMember | Add-Member @MemberArgs | Select-Object $Properties
  }
}
