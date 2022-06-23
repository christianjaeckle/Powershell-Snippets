(Get-ADGroup -Filter * -Properties Members).Where({ $_.Members.Count -eq 0 }) | Select-Object Name, GroupCategory, GroupScope
