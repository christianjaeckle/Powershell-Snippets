# Get file path to script
$FileName = (Get-Item $PSCommandPath ).FullName

# Read content and get characters
$AmountChar = (Get-Content -Path $FileName | Measure-Object -Character).Characters

# Output
$AmountChar
