$User_SID = ((Get-LocalUser -Name $env:USERNAME | Select-Object SID).SID).Value

(New-Object System.Security.Principal.SecurityIdentifier($User_SID)).Translate([System.Security.Principal.NTAccount]).Value
