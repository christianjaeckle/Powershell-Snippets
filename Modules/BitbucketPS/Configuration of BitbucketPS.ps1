# Import-Module BitbucketPS

# Configuration
if ((Get-BitbucketConfigServer) -eq $null) {
    Write-Output "Set configuration for Bitbucket..."
    
    Set-BitbucketConfigServer -Server "https://bitbucket.company.com"
}
