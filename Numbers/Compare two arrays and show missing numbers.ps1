# Define arrays which should be compared
$arrA = 1..10
$arrB = @(1, 3, 4, 5, 6, 7, 8, 10)

# Compare arrays and show missing numbers
Compare-Object -ReferenceObject $arrA -DifferenceObject $arrB | Where-Object { $_.SideIndicator -eq '<=' } | Foreach-Object { $_.InputObject }
