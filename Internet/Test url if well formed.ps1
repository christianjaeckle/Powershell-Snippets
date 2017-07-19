<#
.Synopsis
   Check if a given url is well formed.
.DESCRIPTION
   This function can be used to check if a given url is well formed.
.EXAMPLE
   Test-UrlIsWellFormed -Url http://www.google.com
.EXAMPLE
   Test-UrlIsWellFormed http://www.google.com
#>
function Test-UrlIsWellFormed
{
    [CmdletBinding()]
    [Alias()]
    [OutputType([boolean])]
    Param(
        # TeamViewer Access token
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true,
                   Position=0)]
        [string]$Url
    )

    Begin
    {
        [boolean]$UrlIsValid = $false

        Write-Verbose -Message "Given url is: $Url"
    }
    Process
    {
        # Check if url to API is well formed
        if ([system.uri]::IsWellFormedUriString($Url, [System.UriKind]::Absolute)) {
            $UrlIsValid = $true

            Write-Verbose -Message "The url is well formed."
        } else {
            $UrlIsValid = $false

            Write-Verbose -Message "The url is NOT well formed."
        }
    }
    End
    {
        return $UrlIsValid
    }
}

Test-UrlIsWellFormed ftp://google.com
