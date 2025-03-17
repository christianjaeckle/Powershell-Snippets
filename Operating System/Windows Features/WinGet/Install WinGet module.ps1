if (-not(Get-Module -Name Microsoft.WinGet.Client -ListAvailable)) {
    Install-Module -Name Microsoft.WinGet.Client -Force -Repository PSGallery
}
