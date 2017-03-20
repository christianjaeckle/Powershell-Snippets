[System.Enum]::GetValues([System.Security.Principal.WindowsBuiltInRole]) | ForEach-Object -Process { "{0}: {1}" -f ([System.Security.Principal.WindowsBuiltInRole]::$_.Value__),$_ }
