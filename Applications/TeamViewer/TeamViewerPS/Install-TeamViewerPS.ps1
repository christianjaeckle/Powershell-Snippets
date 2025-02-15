#Requires -Version 5.1

Set-StrictMode -Version Latest

function Install-TeamViewerPS {
    [CmdletBinding(DefaultParameterSetName = 'Path', SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $false)]
        [ValidateSet('User', 'Machine')]
        [string]$Scope = 'User'
    )

    begin {
        Write-Verbose -Message 'Test if TeamViewerPS module is already installed...'

        If ($Scope -eq 'User') {
            $Scope = 'CurrentUser'
        }
        else {
            $Scope = 'AllUsers'
        }
    }

    process {
        if (Test-TeamViewerPS -eq $true) {
            Write-Verbose -Message 'TeamViewerPS module is already installed.'
        }
        else {
            Write-Verbose -Message 'Installing TeamViewerPS...'

            Install-Module -Name TeamViewerPS -MinimumVersion '2.0.0' -Scope $Scope -Confirm:$false -Force -WhatIf:$WhatIfPreference
        }
    }
}
