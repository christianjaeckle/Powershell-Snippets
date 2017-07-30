<#
.Synopsis
   Convert JSON file containing TeamViewer session reports to csv file.
.DESCRIPTION
   Convert a JSON file, which contains TeamViewer session reports, to a passed csv file.
.EXAMPLE
   Convert-TVSessionReportsFromJSONToCSV -SourceFile "C:\Temp\Source.json" -TargetFile "C:\Temp\Target.csv"
.EXAMPLE
   Convert-TVSessionReportsFromJSONToCSV "C:\Temp\Source.json" "C:\Temp\Target.csv"
#>
function Convert-TVSessionReportsFromJSONToCSV
{
    [CmdletBinding()]
    [Alias()]
    [OutputType([int])]
    Param (
        # Source file with JSON content
        [Parameter(Mandatory = $true,
            HelpMessage = "Enter a file system path to a file with the json content, which will be used as source.",
            ValueFromPipelineByPropertyName = $true,
            Position = 0)
        ]
        [string]$SourceFile,

        # Target file in CSV format
        [Parameter(Mandatory = $false,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "Enter a file system path to a file, which will be used as target file.",
            Position = 1)
        ]
        [string]$TargetFile
    )
    Begin {
        # Check if source file exists
        if (Test-Path -Path $SourceFile) {
            Write-Verbose "Source file '$SourceFile' exists."

            # Check if source file contains valid JSON content
            # TODO: Check JSON validity
        }
        else {
            Write-Verbose "Source file '$SourceFile' doesn't exist."

            Exit 1
        }

        if ($TargetFile -eq $null -or $TargetFile -eq "") {
            $Script_Name = Split-Path $MyInvocation.PSCommandPath -Leaf
            $TargetFile = "$env:userprofile\Desktop\$Script_Name.csv"
        }
        else {
            # Check if target file exists
            if (Test-Path -Path $TargetFile) {
                Write-Verbose "Target file '$TargetFile' already exists."
                
                # TODO: Error handling
                Exit 1
            }
            else {
                Write-Verbose "Target file '$TargetFile' doesn't exist."
            }
        }
    }
    Process {
        # Start convertion
        Write-Verbose "Start convertion..."

        (Get-Content -Path $SourceFile -Raw | ConvertFrom-Json).records | Select-Object -Property id, userid, username, deviceid, devicename, start_date, end_date, fee, currency, billing_state, contact_id, notes | ConvertTo-Csv -Delimiter ";" -NoTypeInformation | Out-File -FilePath $TargetFile

        Write-Verbose "Convertion done."
    }
    End {
        Write-Verbose "Convertion done. Output file: $TargetFile"
    }
}

Convert-TVSessionReportsFromJSONToCSV -SourceFile "$env:userprofile\Desktop\Get TV session reports.json" -TargetFile "" -Verbose
