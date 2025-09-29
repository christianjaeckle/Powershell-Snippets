$Name = 'Company Portal'

if ((Get-Culture).Name -eq 'de-DE') {
    ((New-Object -Com Shell.Application).NameSpace('Shell:::{4234d49b-0245-4df3-b780-3893943456e1}').Items() | Where-Object { $_.Name -eq $Name } ).Verbs() | Where-Object { $_.Name.Replace('&', '') -match 'Von Taskleiste lösen' } | ForEach-Object { $_.DoIt() }
}
else {
    ((New-Object -Com Shell.Application).NameSpace('Shell:::{4234d49b-0245-4df3-b780-3893943456e1}').Items() | Where-Object { $_.Name -eq $Name } ).Verbs() | Where-Object { $_.Name.Replace('&', '') -match 'Unpin from taskbar' } | ForEach-Object { $_.DoIt() }
}
