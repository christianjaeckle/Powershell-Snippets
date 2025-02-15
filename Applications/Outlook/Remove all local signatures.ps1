# Define signature folder
$Sign_Folder = Join-Path -Path $env:APPDATA -ChildPath "\Microsoft\Signatures"

# Delete
Get-ChildItem -Path $Sign_Folder | Remove-Item -Recurse -Force -Verbose
