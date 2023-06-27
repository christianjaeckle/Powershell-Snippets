$Hosts = @(
    'PC1'
    'PC2'
    '8.8.8.8'
)


# Clean-up existing background jobs
Get-Job | Remove-Job

# Add new background job
Start-Job -Name 'Pinging' -ScriptBlock { Test-Connection -ComputerName $using:Hosts -Count 1 }

# Get status of running background jobs
Get-Job -State 'Running'

# Get results of background job
Receive-Job -Name 'Pinging' -Keep
