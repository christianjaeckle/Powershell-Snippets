if (-not(Get-Module -Name Microsoft.WinGet.Client -ListAvailable)) {
    Install-Module Microsoft.WinGet.Client -Scope AllUsers
}
