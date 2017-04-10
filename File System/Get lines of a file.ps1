# Get file path to script
$FileName = (Get-Item $PSCommandPath ).FullName

# Read content and get characters
$Lines = (Get-Content -Path $FileName | Measure-Object -Line).Lines

# Output
$Lines
