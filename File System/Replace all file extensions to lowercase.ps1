Get-ChildItem "X:\Folder" -Recurse | Where-Object { !$_.PSIsContainer} | Rename-Item $_.Extension {$_.Extension.ToLower() }
