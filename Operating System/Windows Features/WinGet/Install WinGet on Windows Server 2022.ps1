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
[string]$WinGet_Repo = 'https://api.github.com/repos/microsoft/winget-cli/releases/latest'


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


# Winget
[PSCustomObject]$WinGet_Release = Invoke-RestMethod -Uri $WinGet_Repo
$WinGet_AssetUrls = $WinGet_Release.assets.browser_download_url

# Get msix file
$WinGet_MsixUrl = $WinGet_AssetUrls | Where-Object { $_.EndsWith('.msixbundle') }
$WinGet_MsixFileName = $WinGet_MsixUrl.Split('/')[-1]
$WinGet_MsixFilePath = (Join-Path -Path $Download_Path -ChildPath $WinGet_MsixFileName)

if (-not(Test-Path -PathType Leaf -Path $WinGet_MsixFilePath)) {
    Invoke-WebRequest -Uri $WinGet_MsixUrl -Method Get -OutFile $WinGet_MsixFilePath -Verbose
}

$WinGet_LicenseUrl = $WinGet_AssetUrls | Where-Object { $_.EndsWith('_License1.xml') }
$WinGet_LicenseFileName = $WinGet_LicenseUrl.Split('/')[-1]
$WinGet_LicenseFilePath = (Join-Path -Path $Download_Path -ChildPath $WinGet_LicenseFileName)

if (-not(Test-Path -PathType Leaf -Path $WinGet_LicenseFilePath)) {
    Invoke-WebRequest -Uri $WinGet_LicenseUrl -Method Get -OutFile $WinGet_LicenseFilePath -Verbose
}

Unblock-File -Path $WinGet_MsixFilePath -Confirm:$false
Add-AppxProvisionedPackage -Online -PackagePath $WinGet_MsixFilePath -LicensePath $WinGet_LicenseFilePath -Verbose


# Permissions
[string]$WG_AppPath = 'C:\Program Files\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe'
$AdmGrp_SID = New-Object System.Security.Principal.SecurityIdentifier('S-1-5-32-544')
$AdmGrp = $AdmGrp_SID.Translate([System.Security.Principal.NTAccount])

$WG_AppsVerPath = Get-ChildItem -Path $WG_AppPath -Directory
foreach ($WG_AppVerPath in $WG_AppsVerPath) {
    $Acls = Get-Acl -Path $WG_AppVerPath.FullName

    $AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule($AdmGrp, 'FullControl', 'ContainerInherit,ObjectInherit', 'None', 'Allow')
    $Acls.SetAccessRule($AccessRule)
    Set-Acl -Path $WG_AppVerPath.FullName -AclObject $Acls
}

# Environment Variable
$WG_AppResPath = Resolve-Path -Path $WG_AppPath
if ($WG_AppResPath) {
    $WingetPath = $WG_AppResPath[-1].Path
}
$ENV:PATH += ";$WingetPath"
