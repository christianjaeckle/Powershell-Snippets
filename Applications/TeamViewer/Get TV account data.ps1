[string]$TV_APIUrl = "https://webapi.teamviewer.com"
[string]$TV_AccessToken = "YOURTOKEN"

<#
.Synopsis
   Verify if a TeamViewer access token is valid.
.DESCRIPTION
   This function can be used to check if the TeamViewer API is answers and to verify if a given access token is valid.
.EXAMPLE
   Test-TVAccessToken -AccessToken 2011827-SRt2xEgwOKAeqErC6pj2
.EXAMPLE
   Test-TVAccessToken 2011827-SRt2xEgwOKAeqErC6pj2
#>
function Test-TVAccessToken
{
    [CmdletBinding()]
    [Alias()]
    [OutputType([boolean])]
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
        [boolean]$TokenIsValid = $false
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
        [string]$Req_Url = $TV_APIUrl + "/api/v1/ping"

        Write-Verbose -Message "Request url for API method is: $Req_Url"
    }
    Process
    {
        if($UrlIsValid -eq $true) {
            try {
                Write-Verbose -Message "Starting with API request..."

                $ReqResult = Invoke-RestMethod -Uri $Req_Url -Method Get -Headers $Req_Header -ContentType "application/json"

                if(($ReqResult).token_valid) {
                    $TokenIsValid = $true

                    Write-Verbose -Message "The token is valid."
                }
                else
                {
                    $TokenIsValid = $false

                    Write-Verbose -Message "The token is NOT valid."
                }
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
        return $TokenIsValid
    }
}

Test-TVAccessToken -AccessToken $TV_AccessToken -Verbose
