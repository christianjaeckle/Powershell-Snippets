# Define variables
[string]$Script_BaseName = (Get-Item $PSCommandPath ).Basename # Name of this script
[string]$TV_APIUri = "https://webapi.teamviewer.com" # Url of the TeamViewer API
[string]$TV_APIVersion = "v1" # Version of the TeamViewer API
[string]$TV_APIToken = "YOURTOKEN" # Token (company or user) for the TeamViewer API

# Define request header for auth
$Headers = @{}
$Headers.Add("Authorization", "Bearer $TV_APIToken")

try {
    # Execute request
    $APIResponse = Invoke-RestMethod -Uri "$TV_APIUri/api/$TV_APIVersion/reports/connections" -Headers $Headers -Method Get -ErrorVariable APIError -ErrorAction SilentlyContinue

    # Check if errors occurred
    if ($APIError) {
        $StatusCode = $APIError.ErrorRecord.Exception.Response.StatusCode.value__
        $StatusDescription = $APIError.ErrorRecord.Exception.Response.StatusDescription
        
        Write-Error "Http status code: $($HttpStatusCode) `nHttp status description: $($HttpStatusDescription)"
    }
    else {
        # Convert request result to JSON format
        $APIResponseJSON = ConvertTo-Json -InputObject @($APIResponse) -Depth 4

        # Save JSON to file
        $APIResponseJSON | Out-File -FilePath "$env:userprofile\Desktop\$Script_BaseName.json"
    }
}
Catch {
    # Error handling
    $StatusCode = $APIError.ErrorRecord.Exception.Response.StatusCode.value__
    $StatusDescription = $APIError.ErrorRecord.Exception.Response.StatusDescription
    
    Write-Error "Http status code: $($HttpStatusCode) `nHttp status description: $($HttpStatusDescription)"
}
