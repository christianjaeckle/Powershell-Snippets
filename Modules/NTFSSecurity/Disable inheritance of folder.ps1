# Disable inheritance of folder and remove inherited permissions
Disable-NTFSAccessInheritance -Path = 'C:\Example' -RemoveInheritedAccessRules = $True
