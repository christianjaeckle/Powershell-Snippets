if (Test-Path -PathType Container -Path (Join-Path -Path $Home -ChildPath '.dotnet\tools')) {
    Write-Output '.NET Global Tool' 
} elseif (Test-Path -PathType Container -Path (Join-Path -Path $Env:ProgramFiles -ChildPath 'PowerShell\7')) {
    Write-Output 'MSI or WinGet' 
} elseif (Test-Path -PathType Container -Path (Join-Path -Path $Env:ProgramFiles -ChildPath 'WindowsApps')) {
    Write-Output 'Store or WinGet (ARM)' 
} else {
    Write-Output 'Zip'
}
