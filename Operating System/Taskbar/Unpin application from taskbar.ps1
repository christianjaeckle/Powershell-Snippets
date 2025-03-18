if((Get-Culture).Name -eq "de-DE") {
    $AppName = "Unternehmensportal"
     
    ((New-Object -Com Shell.Application).NameSpace("Shell:::{4234d49b-0245-4df3-b780-3893943456e1}").Items() | ? { $_.Name -eq $AppName } ).Verbs() | ?{ $_.Name.Replace("&", "") -Match "Von Taskleiste lösen" } | %{ $_.DoIt(); $Exec = $true }
} else {
    $AppName = "Company Portal"
     
    ((New-Object -Com Shell.Application).NameSpace("Shell:::{4234d49b-0245-4df3-b780-3893943456e1}").Items() | ? { $_.Name -eq $AppName } ).Verbs() | ?{ $_.Name.Replace("&", "") -Match "Unpin from taskbar" } | %{ $_.DoIt(); $Exec = $true }
}
