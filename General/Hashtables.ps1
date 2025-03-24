# Create empty hashtable
$List = @{}

# Create hashtable
$List = @{
    5 = 'Something'
    8 = 'Something else'
}

# Create ordered hashtable
$List = [ordered]@{
    5 = 'Something'
    8 = 'Something else'
}

$List = @{ Name = 'Name'; Age = 55; }

# Add element
$List.Add(5, 'Something')

# Get specific element
$List[5]

# Get specific element (property based)
$List.5

# Get number of elements
$List.Count

# Iterate through hashtable
$List.Keys | ForEach-Object {
    Write-Output $List[$_]
}

foreach ($Element in $List.Keys) {
    Write-Output "$Element $List[$Element]"
}
