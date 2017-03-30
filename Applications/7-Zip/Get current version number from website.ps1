# Checking if website is available
if( (Test-NetConnection -ComputerName "7-zip.org" -CommonTCPPort HTTP).TcpTestSucceeded -eq $true ) {
    Write-Verbose -Message "Website is available."

    # Request website content
    $Website = Invoke-WebRequest -Uri "http://www.7-zip.org"

    if($Website.StatusCode -eq 200) {
        Write-Verbose -Message "Got website content."

        $Url = ($Website.AllElements | Where-Object { ($_.TagName -eq "b") -and ($_.innerText -like "Download 7-Zip*") }).innerText

        [int]$PosFirstMinus = $Url.IndexOf("p") + 2
        [int]$PosLastMinus = $Url.LastIndexOf("(") - 1
        
        $CurrentVersion = $Url.Substring($PosFirstMinus,($PosLastMinus - $PosFirstMinus))
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
