#Import-Module ConfluencePS

# Configuration
if ((Set-WikiInfo) -eq $null) {
    Write-Output "Set configuration for Confluence..."
    
    Set-WikiInfo -BaseURI "https://confluence.company.com"
}
