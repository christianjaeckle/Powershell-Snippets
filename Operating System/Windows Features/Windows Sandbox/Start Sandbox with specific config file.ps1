# Path to WSB config file
$Sandbox_ConfigFilePath = (Join-Path -Path $PSScriptRoot -ChildPath 'Sandbox_Config.wsb')

# Create Sandbox config
# https://learn.microsoft.com/en-us/windows/security/application-security/application-isolation/windows-sandbox/windows-sandbox-configure-using-wsb-file
$Sandbox_Config = @()
$Sandbox_Config += '<Configuration>'
$Sandbox_Config += '<vGPU>Enable</vGPU>'
$Sandbox_Config += '<MemoryInMB>8192</MemoryInMB>'
$Sandbox_Config += '<Networking>Enable</Networking>'
$Sandbox_Config += '<VideoInput>Disable</VideoInput>'
$Sandbox_Config += '<AudioInput>Disable</AudioInput>'
$Sandbox_Config += '<PrinterRedirection>Disable</PrinterRedirection>'
$Sandbox_Config += '<ClipboardRedirection>Enable</ClipboardRedirection>'
$Sandbox_Config += '<ProtectedClient>Disable</ProtectedClient>'
$Sandbox_Config += '<MappedFolders>'
$Sandbox_Config += '<MappedFolder><HostFolder>D:\Windows Sandbox</HostFolder><SandboxFolder>C:\Sandbox</SandboxFolder><ReadOnly>true</ReadOnly></MappedFolder>'
$Sandbox_Config += '</MappedFolders>'
$Sandbox_Config += '<LogonCommand><Command>C:\Sandbox\Autostart.cmd</Command></LogonCommand>'
$Sandbox_Config += '</Configuration>'

$Sandbox_Config | Out-File -FilePath $Sandbox_ConfigFilePath -Encoding utf8

Start-Process (Join-Path $env:WinDir -ChildPath 'system32\WindowsSandbox.exe') -ArgumentList "$Sandbox_ConfigFilePath"
