<#
.Synopsis
   Converts username and password for TeamViewer API into expected format
.DESCRIPTION
   Converts username and password for the TeamViewer API into the expected format for credentials
.EXAMPLE
   Convert-TVAuthCredentials -Username "YourUser" -Password "YourPassword"
.EXAMPLE
   Convert-TVAuthCredentials "YourUser" "YourPassword"
#>
function Convert-TVAuthCredentials
{
    [CmdletBinding()]
    [Alias()]
    [OutputType([int])]
    Param
    (
        # Username for TeamViewer
        [Parameter(
            Mandatory = $true,
            ValueFromPipelineByPropertyName = $true,
            Position = 0)
        ]
        [string]$Username,

        # Password for TeamViewer
        [Parameter(
            Mandatory = $true,
            ValueFromPipelineByPropertyName = $true,
            Position = 01)
        ]
        [string]$Password
    )
    Begin {
        $CredentialString = "{0}:{1}" -f $Username,$Password
    }
    Process {
        $CredentialBytes  = [System.Text.Encoding]::Ascii.GetBytes($CredentialString)
    }
    End {
        Return [convert]::ToBase64String($CredentialBytes)
    }
}

$BasicCreds = Convert-TVAuthCredentials -Username "$env:username" -Password "Password"
