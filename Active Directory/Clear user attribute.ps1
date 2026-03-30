# Clear / empty attribute of all users in a specific organizational unit (OU)
Get-ADUser -Filter * -SearchBase „OU=Users,OU=Company,DC=domain,DC=local“ | Set-ADUser -Clear profilepath
