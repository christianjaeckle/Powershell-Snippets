#Requires -Version 5.1
#Requires -PSEdition Desktop
#Requires -RunAsAdministrator

Set-StrictMode -Version Latest


# Script specific variables
[string]$Download_Path = (Join-Path -Path $env:UserProfile -ChildPath 'Desktop')
[string]$UIXaml_Uri = 'https://www.nuget.org/api/v2/package/Microsoft.UI.Xaml/2.8.7'
[string]$UIXaml_Path = (Join-Path -Path $Download_Path -ChildPath 'Microsoft.UI.Xaml_2.8.7')
[string]$UIXaml_FilePath = (Join-Path -Path $Download_Path -ChildPath 'Microsoft.UI.Xaml_2.8.7.zip')
[string]$VCLibs_Uri = 'https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx'
[string]$VCLibs_FilePath = (Join-Path -Path $Download_Path -ChildPath 'Microsoft.VCLibs.x64.14.00.Desktop.appx')
[string]$WinTerm_Repo = 'https://api.github.com/repos/microsoft/terminal/releases/latest'


# VCLibs
if (-not(Test-Path -PathType Leaf -Path $VCLibs_FilePath)) {
    Invoke-WebRequest -Uri $VCLibs_Uri -Method Get -OutFile $VCLibs_FilePath -Verbose
}

Unblock-File -Path $VCLibs_FilePath -Confirm:$false
Add-AppxPackage -Path $VCLibs_FilePath -Confirm:$false -Verbose


# UI.Xaml
if (-not(Test-Path -PathType Leaf -Path $UIXaml_FilePath)) {
    Invoke-WebRequest -Uri $UIXaml_Uri -Method Get -OutFile $UIXaml_FilePath -Verbose
}

Unblock-File -Path $UIXaml_FilePath -Confirm:$false
Expand-Archive -Path $UIXaml_FilePath -DestinationPath $UIXaml_Path -Confirm:$false -Force
Add-AppxPackage -Path (Join-Path -Path $UIXaml_Path -ChildPath 'Tools\AppX\x64\Release\Microsoft.UI.Xaml.2.8.appx') -Confirm:$false -Verbose


# Windows Terminal
[PSCustomObject]$WinTerm_Release = Invoke-RestMethod -Uri $WinTerm_Repo
$WinTerm_AssetUrls = $WinTerm_Release.assets.browser_download_url

# Get msix file
$WinTerm_MsixUrl = $WinTerm_AssetUrls | Where-Object { $_.EndsWith('.msixbundle') }
$WinTerm_MsixFileName = $WinTerm_MsixUrl.Split('/')[-1]
$WinTerm_MsixFilePath = (Join-Path -Path $Download_Path -ChildPath $WinTerm_MsixFileName)

if (-not(Test-Path -PathType Leaf -Path $WinTerm_MsixFilePath)) {
    Invoke-WebRequest -Uri $WinTerm_MsixUrl -Method Get -OutFile $WinTerm_MsixFilePath -Verbose
}

# Install WinGet
Unblock-File -Path $WinTerm_MsixFilePath -Confirm:$false
Add-AppxProvisionedPackage -Online -PackagePath $WinTerm_MsixFilePath -Verbose
