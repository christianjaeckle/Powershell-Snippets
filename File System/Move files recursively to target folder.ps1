$DirSource = 'X:\Source'
$DirTarget = 'T:\Target\Something'

Get-Childitem -Path $DirSource -Recurse -File |
ForEach-Object {
    $_ | Move-Item -Destination $DirTarget
}
