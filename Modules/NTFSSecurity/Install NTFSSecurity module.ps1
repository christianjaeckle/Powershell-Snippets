if (-not(Get-Module -Name 'NTFSSecurity' -ListAvailable)) {
    Install-Module -Name 'NTFSSecurity' -Force -Repository PSGallery
}
