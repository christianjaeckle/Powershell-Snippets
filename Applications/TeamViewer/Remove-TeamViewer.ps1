#Requires -Version 3.0
#Requires -RunAsAdministrator

$WarningPreference = 'SilentlyContinue'
$ErrorActionPreference = 'SilentlyContinue'

# Uninstall TVRM
Start-Process -FilePath (Join-Path -Path $env:ProgramFiles -ChildPath 'ITbrain\Monitoring\setup.exe') -ArgumentList '/uninstall' -Wait -ErrorAction SilentlyContinue
Start-Process -FilePath (Join-Path -Path ${env:ProgramFiles(x86)} -ChildPath 'ITbrain\Monitoring\setup.exe') -ArgumentList '/uninstall' -Wait -ErrorAction SilentlyContinue

# Uninstall drivers (VPN, display, remote printing)
# TODO

# Uninstall COM API
Start-Process -FilePath (Join-Path -Path $env:ProgramFiles -ChildPath 'TeamViewer\TeamViewer.exe') -ArgumentList '--UninstallAPI --StartedByInstaller' -Wait -ErrorAction SilentlyContinue
Start-Process -FilePath (Join-Path -Path ${env:ProgramFiles(x86)} -ChildPath 'TeamViewer\TeamViewer.exe') -ArgumentList '--UninstallAPI --StartedByInstaller' -Wait -ErrorAction SilentlyContinue
Start-Process -FilePath (Join-Path -Path $env:ProgramFiles -ChildPath 'TeamViewer\TeamViewer.exe') -ArgumentList 'api --uninstall' -Wait -ErrorAction SilentlyContinue
Start-Process -FilePath (Join-Path -Path ${env:ProgramFiles(x86)} -ChildPath 'TeamViewer\TeamViewer.exe') -ArgumentList 'api --uninstall' -Wait -ErrorAction SilentlyContinue

# Stop service
Stop-Service -Name TeamViewer -Force -ErrorAction SilentlyContinue

# Stop application
Stop-Process -Name TeamViewer -Force -ErrorAction SilentlyContinue
Stop-Process -Name TeamViewer_Desktop -Force -ErrorAction SilentlyContinue
Stop-Process -Name TeamViewer_Service -Force -ErrorAction SilentlyContinue

# Uninstall application
# Latest versions
Start-Process -FilePath (Join-Path -Path $env:ProgramFiles -ChildPath 'TeamViewer\Uninstall.exe') -ArgumentList '/s' -Wait -ErrorAction SilentlyContinue
Start-Process -FilePath (Join-Path -Path ${env:ProgramFiles(x86)} -ChildPath 'TeamViewer\Uninstall.exe') -ArgumentList '/s' -Wait -ErrorAction SilentlyContinue
Start-Process -FilePath (Join-Path -Path $env:ProgramFiles -ChildPath 'TeamViewer\TeamViewer_Service.exe') -ArgumentList '-uninstall' -Wait -ErrorAction SilentlyContinue
Start-Process -FilePath (Join-Path -Path ${env:ProgramFiles(x86)} -ChildPath 'TeamViewer\TeamViewer_Service.exe') -ArgumentList '-uninstall' -Wait -ErrorAction SilentlyContinue

# Older versions
5..14 | ForEach-Object -Process {
    Start-Process -FilePath (Join-Path -Path $env:ProgramFiles -ChildPath "TeamViewer\version$_\TeamViewer_Service.exe") -ArgumentList '-uninstall' -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath (Join-Path -Path ${env:ProgramFiles(x86)} -ChildPath "TeamViewer\version$_\TeamViewer_Service.exe") -ArgumentList '-uninstall' -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath (Join-Path -Path $env:ProgramFiles -ChildPath "TeamViewer\version$_\Uninstall.exe") -ArgumentList '/s' -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath (Join-Path -Path ${env:ProgramFiles(x86)} -ChildPath "TeamViewer\version$_\Uninstall.exe") -ArgumentList '/s' -Wait -ErrorAction SilentlyContinue
}

# Uninstall application via msi
$MSI = Get-CimInstance -ClassName Win32_Product -Filter "name LIKE '%TeamViewer%Wrapper%'" | Select-Object -Property IdentifyingNumber, Name, LocalPackage
if ($MSI) {
    $MSIID = $MSI.IdentifyingNumber
  
    Start-Process -FilePath (Join-Path -Path $env:WinDir -ChildPath 'System32\msiexec.exe') -ArgumentList "/x $MSIID /qn /log $env:Temp\Remove-TV.log" -Wait -ErrorAction SilentlyContinue
}
  
$MSI = Get-CimInstance -ClassName Win32_Product -Filter "name LIKE '%TeamViewer%'" | Select-Object -Property IdentifyingNumber, Name, LocalPackage
if ($MSI) {
    $MSIID = $MSI.IdentifyingNumber
  
    Start-Process -FilePath (Join-Path -Path $env:WinDir -ChildPath 'System32\msiexec.exe') -ArgumentList "/x $MSIID /qn /log $env:Temp\Remove-TV.log" -Wait -ErrorAction SilentlyContinue
}

# Remove firewall rules
Get-NetFirewallRule -DisplayName 'TeamViewer Remote Control *' -ErrorAction SilentlyContinue | Remove-NetFirewallRule -ErrorAction SilentlyContinue

# Clean filesystem
Remove-Item -Path (Join-Path -Path $env:ProgramFiles -ChildPath 'TeamViewer') -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path (Join-Path -Path ${env:ProgramFiles(x86)} -ChildPath 'TeamViewer') -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path (Join-Path -Path $env:LocalAppData -ChildPath 'TeamViewer') -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path (Join-Path -Path $env:AppData -ChildPath 'TeamViewer') -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path (Join-Path -Path $env:AppData -ChildPath 'Temp\TeamViewer') -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path (Join-Path -Path $env:WinDir -ChildPath 'Fonts\teamviewer*.otf') -Force -ErrorAction SilentlyContinue
Remove-Item -Path (Join-Path -Path $env:Public -ChildPath 'Desktop\TeamViewer*.lnk') -Force -ErrorAction SilentlyContinue
Remove-Item -Path (Join-Path -Path $env:ProgramData -ChildPath 'Microsoft\Windows\Start Menu\Programs\TeamViewer*.lnk') -Force -ErrorAction SilentlyContinue
Remove-Item -Path (Join-Path -Path $env:AppData -ChildPath 'Microsoft\Windows\SendTo\TeamViewer.lnk') -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path (Join-Path -Path $env:SystemDrive -ChildPath 'Users\Default\AppData\Roaming\Microsoft\Windows\SendTo\TeamViewer.lnk') -Recurse -Force -ErrorAction SilentlyContinue

# Clean registry
Remove-Item -Path 'HKCU:\Software\TeamViewer' -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path 'HKLM:\Software\TeamViewer' -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path 'HKLM:\Software\Wow6432Node\TeamViewer' -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\TeamViewer' -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path 'HKU:\.DEFAULT\Software\TeamViewer' -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path 'HKU:\.DEFAULT\Software\Wow6432Node\TeamViewer' -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path 'HKCR:\teamviewer8' -Recurse -Force -ErrorAction SilentlyContinue
Remove-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts' -Name 'teamviewer8_teamviewer8' -ErrorAction SilentlyContinue
Remove-ItemProperty -Path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Fonts" -Name "TeamViewer*" -ErrorAction SilentlyContinue
