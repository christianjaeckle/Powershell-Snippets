# Stop Edge process
Stop-Process -Name 'msedge' -ErrorAction SilentlyContinue

# Read file content
$LocalState_FilePath = (Join-Path -Path $Env:LocalAppData -ChildPath 'Microsoft\Edge\User Data\Local State')
$LocalState_Content = (Get-Content -Path $LocalState_FilePath -Raw | ConvertFrom-Json)

# Backup profile settings
$LocalState_Content | ConvertTo-Json | Out-File -FilePath (Join-Path -Path $PSScriptRoot -ChildPath 'Edge - Profile - Settings.json')
