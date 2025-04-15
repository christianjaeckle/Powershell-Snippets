# Authentication, if needed
$Cred = Get-Credential -Message "Please enter your Jira credentials" -UserName ${env:username}

# Get versions of a project for current year
$DateFilter = Get-Date -Year (Get-Date -UFormat %Y) -Month 1 -Day 1

Get-JiraVersion -Credential $Cred -Project 'YourProject' -Sort releaseDate | Where-Object { $_.Released -eq "True" -and $_.Name -notlike "Service*" -and $_.ReleaseDate -ge $DateFilter } | Select-Object Name, Description, ReleaseDate
