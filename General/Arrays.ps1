# Define array
$Array = @(1, 2, 3, 5, 6, 7, 8)

# Iterate through array
foreach ($Number in $Array) {
    Write-Output $Number
}

# Get number of elements
$Array.Count

# Get specific element
Write-Output $Array[3]

# OR
Write-Output $Array.Item(3)

# Check if array contains specific element
$Array.Contains(5)
