# By package Id
Find-WinGetPackage -Id 'Notepad++.Notepad++'

# By package moniker
Find-WinGetPackage -Moniker 'pwsh'

# By package name
Find-WinGetPackage -Name 'PowerShell'

# By package name and source
Find-WinGetPackage -Name 'Windows Terminal' -Source winget
