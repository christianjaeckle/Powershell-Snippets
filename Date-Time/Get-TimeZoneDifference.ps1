#Requires -Version 3

Set-StrictMode -Version Latest

function Get-TimeZoneDifference {
    [CmdletBinding()]

    param
    (
        [Parameter(
            Position = 0,
            Mandatory = $true,
            ValueFromPipeline = $true)]
        [String[]]$TimeZones,

        [Parameter(
            Position = 1,
            Mandatory = $false,
            ValueFromPipeline = $true)]
        [Datetime]$Target = (Get-Date)
    )

    begin {
        $TZ_Local = Get-TimeZone
        [System.Collections.Arraylist]$TZ_Result = @()

        $TZ_Result.Add(
            [PSCustomObject]@{
                'Timezone'           = 'Local'
                'Difference (Hours)' = 0
                'Time'               = $Target
            }
        )
    }

    process {
        foreach ($Timzone in $TimeZones) {
            $TZ_Remote = [System.TimeZoneInfo]::FindSystemTimeZoneById($Timzone)

            $TZ_Result.Add(
                [PSCustomObject]@{
                    'Timezone'           = $Timzone
                    'Difference (Hours)' = [float]($TZ_Remote.BaseUtcOffset.TotalHours - $TZ_Local.BaseUtcOffset.TotalHours)
                    'Time'               = [System.TimeZoneInfo]::ConvertTime($Target, $TZ_Local, $TZ_Remote)
                }
            ) | Out-Null
        }

        Write-Output $TZ_Result
    }
}

#Get-TimeZoneDifference -TimeZones 'Central Standard Time', 'Pacific Standard Time'
