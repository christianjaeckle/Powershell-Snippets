function Test-IsLocalAdministrator {
    <#
.SYNOPSIS
    Verify if current user is a local administrator
.DESCRIPTION
    Verify if current user is a local administrator on the current system
.EXAMPLE
    Test-IsLocalAdministrator
#>
    [CmdletBinding()]
    PARAM()
    try {
        ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")
    }
    catch {
        $PSCmdlet.ThrowTerminatingError($_)
    }
}
