$Session = New-PSSession -ComputerName PCNAME
Enter-PSSession $Session

# Show remote process
Get-Process

# Exit session
Exit-PSSession $Session
