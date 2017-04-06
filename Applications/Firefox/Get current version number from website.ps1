# Checking if website is available
if( (Test-NetConnection -ComputerName "mozilla.org" -CommonTCPPort HTTP).TcpTestSucceeded -eq $true ) {
    Write-Verbose -Message "Website is available."

    # Request website content
    $Website = Invoke-WebRequest -Uri "https://www.mozilla.org/de/firefox/new/"

    if($Website.StatusCode -eq 200) {
        Write-Verbose -Message "Got website content."

        $Content = ($Website.Links | Where-Object { ($_.innerHTML -eq "Windows 64-bit") -and ($_.href -like "*?product=firefox-*") } | Select-Object -Property href -Unique).href

        [int]$PosFirstMinus = $Content.IndexOf("-") + 1
        [int]$PosLastMinus = $Content.LastIndexOf("-")
                
        $CurrentVersion = $Content.Substring($PosFirstMinus,($PosLastMinus - $PosFirstMinus))
        $CurrentVersion
    }
    else {
        Write-Verbose -Message "Got no website content!"

        Exit 1
    }
}
else {
    Write-Verbose -Message "Website not available!"

    Exit 1
}
