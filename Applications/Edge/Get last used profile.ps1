# Stop Edge process
Stop-Process -Name 'msedge' -ErrorAction SilentlyContinue

# Read file content
$LocalState_FilePath = (Join-Path -Path $Env:LocalAppData -ChildPath 'Microsoft\Edge\User Data\Local State')
$LocalState_Content = (Get-Content -Path $LocalState_FilePath -Raw | ConvertFrom-Json)

# Current profile name
Write-Output $LocalState_Content.profile.last_used
