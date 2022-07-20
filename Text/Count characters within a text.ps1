# Define string
[string]$String = "Hello World!"

# Count characters
$AmountChar = ($String -as [Char[]]).Count

# Show output
Write-Output $AmountChar
