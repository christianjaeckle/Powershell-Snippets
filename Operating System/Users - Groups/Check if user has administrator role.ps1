# Get current user identity
$UserIdentity = [Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()

# Check role
$IsAdmin = $UserIdentity.IsInRole(544)

if (-not($IsAdmin)) {
    Write-Warning -Message "Not an admin."
}

# OR

# Check role against SID
$IsAdmin = $UserIdentity.IsInRole([System.Security.Principal.SecurityIdentifier]"S-1-5-32-544")

if (-not($IsAdmin)) {
    Write-Warning -Message "Not an admin."
}
