Set-StrictMode -Version Latest

function Test-TeamViewerPS {
    Write-Verbose -Message 'Checking for TeamViewerPS module...'

    if (Get-Module -Name TeamViewerPS) {
        Write-Verbose -Message 'TeamViewerPS is installed.'

        return $true
    }
    else {
        Write-Verbose -Message 'TeamViewerPS is NOT installed.'

        return $false
    }
}
