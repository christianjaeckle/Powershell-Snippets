# Current date time
Get-Date -UFormat %s -Millisecond 0

# Given date timee
$CustomDateTime = Get-Date
Get-Date -UFormat %s -Millisecond 0 $CustomDateTime
