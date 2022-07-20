function Get-StringLastDigit
{
<#
    .SYNOPSIS
        Get the last digit of a string
    .DESCRIPTION
        Get the last digit of a string using Regular Expression
    .PARAMETER String
        Specifies the String to check
#>
[CmdletBinding()]
PARAM($String)
    #Check if finish by Digit
    if ($String -match "^.*\d$")
    {
        $String.Substring(($String.ToCharArray().count)-1)
    }
    else {
		  Write-Verbose -Message 'The string does not finish by a digit.'
	}
}
