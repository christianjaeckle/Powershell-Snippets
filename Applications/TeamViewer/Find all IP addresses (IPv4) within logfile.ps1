$LogFile = Join-Path -Path ('C:\Program Files\TeamViewer') -ChildPath 'TeamViewer15_Logfile.log'
$OutFile = Join-Path -Path "$env:Userprofile\Desktop" -ChildPath 'IP Addresses.txt'
$RegexIPv4 = '\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b'

Select-String -Path $LogFile -Pattern $RegexIPv4 -AllMatches | ForEach-Object { $_.Matches } | ForEach-Object {
    if($_.Value -ne '127.0.0.1') {
        $_.Value | Out-File -FilePath $OutFile -Append
    }
}
