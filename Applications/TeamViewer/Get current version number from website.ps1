# Checking if website is available
if( (Test-NetConnection -ComputerName "teamviewer.com" -CommonTCPPort HTTP).TcpTestSucceeded -eq $true ) {
    Write-Verbose -Message "Website is available."

    # Request website content
    $Website = Invoke-WebRequest -Uri "https://www.teamviewer.com/de/download/windows/"

    if($Website.StatusCode -eq 200) {
        Write-Verbose -Message "Got website content."

        $Url = ( $Website.ParsedHtml.getElementsByTagName("p") | Where-Object { $_.className -eq "DownloadVersion" } ).innerText
                
        $CurrentVersion = $Url.Replace("v","")
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
