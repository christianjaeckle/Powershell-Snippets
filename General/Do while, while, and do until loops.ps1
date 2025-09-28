# Do While
# Runs a specific script block continuously until a specific condition is met.
# Do while loop will always run at least once into the script block.

# Increases a counter by one until it's less 6
[int]$Counter = 1 

do {
    Write-Host "Counter is $Counter."

    $Counter ++
} while ($Counter -le 6)

# While
# Runs into the script block if a specific condition is met.

# Check if PC1 is online, if not, waiting 10 seconds and checking again
while (-not(Test-Connection -ComputerName 'PC1' -Count 1 -Quiet)) {
    Write-Host 'PC1 is still offline, waiting...'

    Start-Sleep -Seconds 10
}

Write-Host 'PC1 is online, continuing...'

# Do Until
# Runs a specific script block until a condition is false.

do {
    Write-Host 'PC1 is still offline, waiting...'

    Start-Sleep -Seconds 10
} until (
    Test-Connection -ComputerName 'PC1' -Count 1 -Quiet
)

Write-Host 'PC1 is online, continuing...'
