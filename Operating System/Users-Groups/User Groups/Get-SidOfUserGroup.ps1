Set-StrictMode -Version 3.0

function Get-SidOfUserGroup {
    [CmdletBinding()]

    param (
        [Parameter(Position = 0, Mandatory = $true, ValueFromPipeline = $true)]
        [string]$Name
    )

    process {
        # Get local user group
        $Group = Get-LocalGroup -Name $Name -ErrorAction SilentlyContinue

        if ($Group) {
            # Get SID for local user group
            Return (($Group).SID)
        }
        else {
            Return $null
        }
    }
}

Get-SidOfUserGroup -Name "Administrators"
