$Session = New-PSSession -ComputerName GK30WS-Pierre
Enter-PSSession $Session

# Show remote process
Get-Process

# Exit session
Exit-PSSession $Session
