$DirSource = 'S:\Pictures\Camera Roll'
$DirTarget = 'T:\Pictures\Camera Roll"'

Get-Childitem -Path $DirSource '20*.*' |
% {
    $DirTargetTemp = $DirTarget + '\' + (-join $_.Name[0..6])
        
    if (!(Test-Path -Path $DirTargetTemp)) {
        New-Item -Path $DirTargetTemp -Type Directory
            
        Write-Host "Create directory: $DirTargetTemp" -ForegroundColor Cyan
    }
        
    $_ | Move-Item -Destination $DirTargetTemp
}
