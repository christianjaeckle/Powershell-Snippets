$Original = 'This is my test text'

# Convert to char array
$Temp = $Original.ToCharArray()

# Use reverse function
[array]::Reverse($Temp)

WriteHost (-join($Temp))
