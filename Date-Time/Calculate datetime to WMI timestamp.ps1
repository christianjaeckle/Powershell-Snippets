# Variable for Unix time (is fix, don't change it)
$datUnixStartDate = New-Object DateTime(1970,1,1,0,0,0,([DateTimeKind]::UTC))
 
# Calculate difference from now / current time in seconds
[int]([DateTime]::UtcNow - $datUnixStartDate).TotalSeconds
