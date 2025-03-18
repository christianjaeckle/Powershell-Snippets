if ((Get-Culture).Name -eq 'de-DE') {
    $AppName = 'Unternehmensportal'
     
    ((New-Object -Com Shell.Application).NameSpace('Shell:::{4234d49b-0245-4df3-b780-3893943456e1}').Items() | Where-Object { $_.Name -eq $AppName } ).Verbs() | Where-Object { $_.Name.Replace('&', '') -Match 'Von Taskleiste lösen' } | ForEach-Object { $_.DoIt(); $Exec = $true }
}
else {
    $AppName = 'Company Portal'
     
    ((New-Object -Com Shell.Application).NameSpace('Shell:::{4234d49b-0245-4df3-b780-3893943456e1}').Items() | Where-Object { $_.Name -eq $AppName } ).Verbs() | Where-Object { $_.Name.Replace('&', '') -Match 'Unpin from taskbar' } | ForEach-Object { $_.DoIt(); $Exec = $true }
}
