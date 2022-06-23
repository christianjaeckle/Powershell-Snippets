<#
.Synopsis
   Invoke-JumpToRegEdit
.DESCRIPTION
   Invoke-JumpToRegEdit opens the registry editor from Windows and jumps to a given / specific registry key.
.EXAMPLE
   Invoke-JumpToRegEdit -RegKey "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion"
#>
function Invoke-JumpToRegEdit
{
    [CmdletBinding(SupportsShouldProcess=$true)]
    Param
    (
        # Registry key which should be opened
        [Parameter(Mandatory=$true, 
                   ValueFromPipeline=$true,
                   ValueFromPipelineByPropertyName=$true, 
                   ValueFromRemainingArguments=$false, 
                   Position=0)]
        [ValidateNotNull()]
        [ValidateNotNullOrEmpty()]
        [string]$RegKey
    )
    Begin
    {
        # Define short names
        $Replacements = @{ ":" = ""
				"HKCU" = "HKEY_CURRENT_USER"
				"HKLM" = "HKEY_LOCAL_MACHINE"
				"HKU" = "HKEY_USERS"
				"HKCC" = "HKEY_CURRENT_CONFIG"
				"HKCR" = "HKEY_CLASSES_ROOT"
        }
        
        # Replace root of reg key
        $Replacements.Keys | % { $RegKey = $RegKey.ToUpper().Replace($_, $Replacements[$_]) }
    }
    Process
    {
        # Set registry key in property of RegEdit
        Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit" -Name "LastKey" -Value $RegKey -Force

        # Execute RegEdit
        Start-Process -FilePath "RegEdit.exe" -ArgumentList "/m" -WorkingDirectory "$env:userprofile\desktop" -WindowStyle Normal
    }
    End
    {
    }
}
