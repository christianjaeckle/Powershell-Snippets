| Goal | Command |
| :--- | :--- |
| Change location to HKEY_CURRENT_USER | `Set-Location HKCU:` |
| Change location to HKEY_LOCAL_MACHINE | `Set-Location HKLM:` |
| List registry subkeys and values | `Get-ChildItem` |
| List registry subkeys only | `Get-ChildItem | Select-Object PSChildName` |
| List registry values only | `Get-ItemProperty .` |
| Get registry data for a specific value | `Get-ItemPropertyValue` (specify -Path and -Name) |
| Test is a registry key exists	| `Test-Path` |
| Create a registry key	| `New-Item` (specify -Path and -Name) |
| Set a default registry key value | `Set-Item` (specify -Path and -Value, omitting -Name) |
| Set a named registry key value | `Set-Item` (specify -Path, -Value, and -Name) |
| Delete a registry value | `Remove-ItemProperty` (specify -Path and -Name) |
| Delete a registry key | `Remove-Item` |
| Search for a registry key | `Get-ChildItem -Recurse` (specify -Path and -Name where -Name uses wildcards) |
| Search for a registry value name | `Get-ChildItem -Recurse -Path . | Where-Object -Property Property -EQ 'SearchValueName'` |
