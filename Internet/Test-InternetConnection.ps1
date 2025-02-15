Set-StrictMode -Version Latest

function Test-InternetConnection() {
    $NetConPro = Get-NetConnectionProfile -ErrorAction SilentlyContinue

    if ($null -ne $NetConPro) {
        (($NetConPro.IPv4Connectivity -eq 'Internet') -or ($NetConPro.IPv6Connectivity -eq 'Internet'))
    }
    else {
        Return $false
    }
}
