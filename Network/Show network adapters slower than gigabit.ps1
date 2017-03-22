Get-NetAdapter | Where-Object { $_.LinkSpeed -ne "1 Gbps" }
