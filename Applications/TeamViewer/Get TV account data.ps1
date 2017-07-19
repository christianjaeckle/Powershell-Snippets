[string]$TV_APIUrl = "https://webapi.teamviewer.com"
[string]$TV_AccessToken = "YOURTOKEN"

<#
.Synopsis
   Retrieves account information of a TeamViewer account.
.DESCRIPTION
   This function can be used to retrieve account information of a TeamViewer account associated with the given user access token.
.EXAMPLE
   Get-TVAccountData -AccessToken 2011827-SRt2xEgwOKAeqErC6pj2
.EXAMPLE
   Get-TVAccountData 2011827-SRt2xEgwOKAeqErC6pj2
#>
function Get-TVAccountData
{
    [CmdletBinding()]
    [Alias()]
    [OutputType()]
    Param(
        # TeamViewer Access token
        [Parameter(Mandatory = $true,
            ValueFromPipelineByPropertyName = $true,
            Position = 0)]
        [string]$AccessToken
    )

    Begin
    {
        Write-Verbose -Message "Url to TeamViewer API is: $TV_APIUrl"
        Write-Verbose -Message "Using access token: $AccessToken"

        # Define variables
        [boolean]$UrlIsValid = $false
        $Req_Header = @{}
        $Req_Header.Add("Authorization", "Bearer $AccessToken")

        # Check if url to API is well formed
        if ([system.uri]::IsWellFormedUriString($TV_APIUrl, [System.UriKind]::Absolute)) {
            $UrlIsValid = $true

            Write-Verbose -Message "Url to API is well formed and seems to be valid."
        } else {
            $UrlIsValid = $false

            Write-Verbose -Message "Url to API is NOT well formed and seems to be invalid."
        }

        # Build uri to method for request
        [string]$Req_Url = $TV_APIUrl + "/api/v1/account"

        Write-Verbose -Message "Request url for API method is: $Req_Url"
    }
    Process
    {
        if($UrlIsValid -eq $true) {
            try {
                Write-Verbose -Message "Starting API request..."

                $ReqResult = Invoke-RestMethod -Uri $Req_Url -Method Get -Headers $Req_Header -ContentType "application/json"
            } catch {
                Write-Output $_.Exception.Response.StatusCode.value__
                Write-Output $_.Exception.Response.StatusDescription

                return $null
            }
        }
        else {
            return $null
        }
    }
    End
    {
        return $ReqResult
    }
}

Get-TVAccountData -AccessToken $TV_AccessToken -Verbose
