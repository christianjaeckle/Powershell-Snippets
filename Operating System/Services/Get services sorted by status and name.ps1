Get-Service | Sort-Object -Property @{ Expression = "Status"; Descending = $True }, @{ Expression = "DisplayName"; Descending = $False }
