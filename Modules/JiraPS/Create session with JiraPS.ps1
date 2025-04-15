#Import-Module JiraPS

# Authentication
if ((Get-JiraSession) -eq $null) {
    Write-Output "Set credentials for Jira..."
    
    $JiraCredentials = Get-Credential -Message "Please enter your credentials for Jira." -UserName "$env:username"

    Write-Output "Create new Jira session..."
    
    New-JiraSession -Credential $JiraCredentials
}
