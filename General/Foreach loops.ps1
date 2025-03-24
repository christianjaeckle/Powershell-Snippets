foreach ($Number in 1, 2, 3, 4, 5) { Write-Host $Num }

$Number

# OR
foreach ($Char in 'a', 'b', 'c', 'd', 'e') { Write-Host $Char }

# OR via pipeline
foreach ($File IN Get-ChildItem -Path $PSScriptRoot -File | { $Sum += $File.Length }
