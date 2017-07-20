# Define variables
[string]$TV_APIUrl = "https://webapi.teamviewer.com" # Url of the TeamViewer API
[string]$TV_APIVersion = "v1" # Version of the TeamViewer API
[string]$TV_APIToken = "YOURTOKEN" # Token (company or user) for the TeamViewer API

$Headers = @{}
$Headers.Add("Authorization", "Bearer $TV_APIToken")

<#
.Synopsis
   Creates a new group.
.DESCRIPTION
   Create a new group associated with the given user / company access token.
.EXAMPLE
   New-TVGroup -AccessToken "2811827-SRt2xEgwOKAeqErC6pj2" -GroupName "Test"
.EXAMPLE
   New-TVGroup "2811827-SRt2xEgwOKAeqErC6pj2" "Test"
#>
function New-TVGroup
{
    [CmdletBinding()]
    [Alias()]
    [OutputType([String])]
    Param
    (
        # TeamViewer Access token
        [Parameter(Mandatory = $true, 
                   ValueFromPipeline = $true,
                   ValueFromPipelineByPropertyName = $true, 
                   ValueFromRemainingArguments = $false, 
                   Position = 0)]
        [ValidateNotNullOrEmpty()]
        [string]
        $AccessToken,

        # Name of the new group
        [Parameter(Mandatory = $true, 
                   ValueFromPipeline = $true,
                   ValueFromPipelineByPropertyName = $true, 
                   ValueFromRemainingArguments = $false, 
                   Position = 1)]
        [ValidateNotNullOrEmpty()]
        [string]
        $GroupName
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
        [string]$Req_Uri = $TV_APIUrl + "/api/$TV_APIVersion/groups"

        Write-Verbose -Message "Request uri for API method is: $Req_Uri"
    }
    Process
    {
        if($UrlIsValid -eq $true) {
            try {
                # Execute request
                Write-Verbose -Message "Start request..."

                $ReqResult = Invoke-RestMethod -Uri $Req_Uri -Method Post -Headers $Req_Header -ContentType "application/json" -Body "{ 'name' : '$GroupName' }" -ErrorVariable APIError -ErrorAction SilentlyContinue

                # Check if errors occurred
                if ($APIError) {
                    $StatusCode = $APIError.ErrorRecord.Exception.Response.StatusCode.value__
                    $StatusDescription = $APIError.ErrorRecord.Exception.Response.StatusDescription
                    
                    Write-Error "Http status code: $($StatusCode) `nHttp status description: $($StatusDescription)"

                    return $null
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
        return ($ReqResult).id
    }
}

New-TVGroup -AccessToken $TV_APIToken -GroupName "Test3" -Verbose
