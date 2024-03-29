# Checking if website is available
if( (Test-NetConnection -ComputerName "piriform.com" -CommonTCPPort HTTP).TcpTestSucceeded -eq $true ) {
    Write-Verbose -Message "Website is available."

    # Request website content
    $Website = Invoke-WebRequest -Uri "http://www.piriform.com/ccleaner/version-history"

    if($Website.StatusCode -eq 200) {
        Write-Verbose -Message "Got website content."

        $Content = ($Website.AllElements | Where-Object { $_.outerText -like "v*" -and $_.tagName -eq "h6" }).innerText | Select-Object -First 1

        [int]$PosFirstBlank = $Content.IndexOf(" ")
        
        $CurrentVersion = $Content.Substring(1,$PosFirstBlank)
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
