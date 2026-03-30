Get-VM | Where-Object { $_.State -eq 'Running' } | Select-Object -ExpandProperty Networkadapters | Select VMName, IPAddresses
