Get-LocalGroup | Where-Object { ($_.Name -like "*_Temp") } | foreach {
  Get-LocalGroupMember -Group $_.Name | Where-Object {$_.Objectclass -Like 'User'} | Remove-LocalGroupMember -Name $_.Name -WhatIf
}
