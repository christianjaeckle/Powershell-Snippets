function Start-ExecuteAppWithParams
{
    [CmdletBinding()]
    [OutputType([System.String])]
    param(
        # Path to application with file name
        [Parameter(Mandatory = $true,
        ValueFromPipelineByPropertyName = $true,
        Position=0)]
        [ValidateNotNullOrEmpty()]
		[string]
		$AppPath,

        # One or multiple parameters
        [Parameter(Mandatory = $false,
        ValueFromPipelineByPropertyName = $true,
        Position=1)]
		[string]
		$Params,

        # Window style
        [Parameter(Mandatory = $false,
        ValueFromPipelineByPropertyName = $true,
        Position=2)]
        [ValidateSet("Normal","Hidden","Maximized","Minimized")]
		[string]
		$WindowStyle
    )
    begin
    {
        # Check if source directory exists
        if (-not (Test-Path -Path $AppPath)) {
            # Check if there are two or more fiels in directory
            Write-Verbose -Object "The given application path doesn't exist or missing access rights!"
            
            $AppResult = $null
        }
    }
    process
    {
        Try {
            # Execute application
            if($Params -eq $null) {
                $AppResult = Start-Process -FilePath $AppPath -WindowStyle $WindowStyle
                Write-Verbose "Application successfully executed."
            }
            else
            {
                $AppResult = Start-Process -FilePath $AppPath -ArgumentList $Params -WindowStyle $WindowStyle
                Write-Verbose "Application successfully executed."
            }
        }
        Catch {
            Write-Error $_.Exception.Message
            Write-Error $_.Exception.ItemName

            $AppResult = $null
        }
    }
    end
    {
        return $AppResult
    }
}

Start-ExecuteAppWithParams -AppPath "$env:windir\Notepad.exe" -WindowStyle Normal
