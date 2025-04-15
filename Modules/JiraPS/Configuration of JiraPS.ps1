#Import-Module JiraPS

# Configuration
if ((Get-JiraConfigServer) -eq $null) {
    Write-Output "Set configuration for Jira..."
    
    Set-JiraConfigServer -Server "https://jira.company.com"
}
