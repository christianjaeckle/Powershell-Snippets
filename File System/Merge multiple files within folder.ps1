function MergeMultipleFiles
{
    <#
    .Synopsis
        Merges multiple files within one folder to one single file.
    .DESCRIPTION
        This function merges the content of multiple files within one folder to one single file.
    .EXAMPLE
        MergeMultipleFiles -SourceDir "$env:userprofile\Desktop\Test\*" -OutputFile "$env:userprofile\Desktop\Test\Output.txt"
        Merges all files from folder "$env:userprofile\Desktop\Test" into file "$env:userprofile\Desktop\Test\Output.txt".
    .EXAMPLE
        MergeMultipleFiles -SourceDir "X:\Folder\*" -OutputFile "X:\Output.txt" -OverwriteOutput true
        Merges all files from folder "X:\Folder" into file "X:\Output.txt" and overwirtes the already existing output file.
    .INPUTS
        Folder path
    .OUTPUTS
        Boolean
    .NOTES
       Notes
    #>
    [CmdletBinding()]
    [OutputType([System.String])]
    param(
        # Input directory
        [Parameter(Mandatory = $true,
        ValueFromPipelineByPropertyName = $true,
        Position=0)]
        [ValidateNotNullOrEmpty()]
		[string]
		$SourceDirectory,

        # Output file
        [Parameter(Mandatory = $true,
        ValueFromPipelineByPropertyName = $true,
        Position=1)]
		[ValidateNotNullOrEmpty()]
		[string]
		$OutputFile,
        
        # Delete existing output file
        [Parameter(Mandatory = $false,
        ValueFromPipelineByPropertyName = $true,
        Position=2)]
		[boolean]
		$OverwriteOutput = $false
    )
    begin
    {
        # Check if source directory exists
        if (Test-Path -Path $SourceDirectory) {
            # Check if there are two or more fiels in directory
            if (-not (Get-ChildItem -Path $SourceDirectory -File | Measure-Object).Count -lt 2) {
                Write-Verbose -Object "No files found in the given source directory!"
				
				Return $false
            }
        }
        else {
            Write-Verbose -Object "Can't access given source directory!"
			
            Return $false
        }

        # Checks for output file
        if (Test-Path -Path $OutputFile) {
            if ($OutputFileOverwrite -eq $true) {
                # Delete existing output file
                Remove-Item -Path $OutputFile -Confirm
                Write-Verbose -Object "Deleted already existing output file."
            }
            else {
                Write-Verbose -Object "Output file already exists."
                
				Return $false
            }
        }
    }
    process
    {
        # Enumerate trough existing files in source directory
        Get-ChildItem -Path $SourceDirectory | ForEach-Object {
            Add-Content -Path $OutputFile -Value $_.FullName
            Get-Content $_.FullName | Add-Content -Path $OutputFile
        }
    }
    end
    {
        Write-Verbose "Successfully merged files." -ForegroundColor Green

        Return $true
    }
}
