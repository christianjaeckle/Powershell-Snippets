#Requires -RunAsAdministrator

[string]$PathToODApp64 = "$env:systemroot\SysWOW64\OneDriveSetup.exe"
[string]$PathToODApp32 = "$env:systemroot\System32\OneDriveSetup.exe"

Write-Output "Kill process..."
(Get-Process -Name "OneDrive" -ErrorAction SilentlyContinue) | ForEach-Object { $_.Kill() | Out-Null }

Write-Output "Start uninstall..."
if(Test-Path -Path $PathToODApp64) {
    Write-Output "for 64-bit..."

    Start-Process -FilePath $PathToODApp64 -ArgumentList "/uninstall" -WindowStyle Hidden -Wait
}

if(Test-Path -Path $PathToODApp32) {
    Write-Output "for 32-bit..."

	Start-Process -FilePath $PathToODApp32 -ArgumentList "/uninstall" -WindowStyle Hidden -Wait
}

Write-Output "Delete relicts from file system..."
$DirectoriesToClean = @("$env:userprofile\OneDrive", "$env:systemdrive\OneDriveTemp", "$env:programdata\Microsoft OneDrive", "$env:localappdata\Microsoft\OneDrive")

ForEach ($Direcotry in $DirectoriesToClean) {
    if(Test-Path -Path "$env:userprofile\OneDrive") {
        Write-Output "Delete folder $Direcotry..."

        Remove-Item -Path $Direcotry -Recurse -Force -ErrorAction SilentlyContinue
    }
}

Write-Output "Delete relicts from registry..."

New-PSDrive -Name "HKCR" -PSProvider Registry -Root "HKEY_CLASSES_ROOT" -ErrorAction SilentlyContinue | Out-Null

Remove-Item -Path "HKCR:\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" -Recurse -Force
Remove-Item -Path "HKCR:\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" -Recurse -Force

Remove-PSDrive -Name "HKCR" -Force | Out-Null

Write-Output "Delete relicts from start menu..."
Remove-Item -Path "$env:appdata\Microsoft\Windows\Start Menu\Programs\OneDrive.lnk" -Force -ErrorAction SilentlyContinue
