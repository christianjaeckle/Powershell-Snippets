function Format-MACAddress
{
    <#
	    .SYNOPSIS
	    Function to cleanup a MAC address
	    .DESCRIPTION
	    Function to cleanup a MAC address

	    .PARAMETER MACAddress
	    Specifies the MAC address

	    .PARAMETER Separator
	    Specifies the separator to split the string every two characters

	    .PARAMETER Uppercase
	    Specifies the output must be Uppercase

	    .PARAMETER Lowercase
	    Specifies the output must be LowerCase

	    .EXAMPLE
	    Format-MACAddress -MACAddress "aa:ab:22:33:44:55"
	    aaab22334455

	    .EXAMPLE
	    Format-MACAddress -MACAddress "aa:ab:22:dD:ee:FF" -Uppercase
	    AAAB22DDEEFF

	    .EXAMPLE
	    Format-MACAddress -MACAddress "aa:ab:22:dD:ee:FF" -Lowercase
	    aaab22ddeeff

	    .EXAMPLE
	    Format-MACAddress -MACAddress "aa:ab:22:dD:ee:FF" -Lowercase -Separator "-"
	    aa-ab-22-dd-ee-ff

	    .EXAMPLE
	    Format-MACAddress -MACAddress "aa:ab:22:dD:ee:FF" -Uppercase -Separator "."
	    AA.AB.22.DD.EE.FF

	    .EXAMPLE
	    Format-MACAddress -MACAddress "aa:ab:22:dD:ee:FF" -Lowercase -Separator :
	    aa:ab:22:dd:ee:ff
    #>
    [OutputType([String], ParameterSetName = "Upper")]
    [OutputType([String], ParameterSetName = "Lower")]
    [CmdletBinding(DefaultParameterSetName = "Upper")]
    param
    (
        [Parameter(ParameterSetName = "Lower")]
        [Parameter(ParameterSetName = "Upper")]
        [String]$MACAddress,
		
        [Parameter(ParameterSetName = "Lower")]
        [Parameter(ParameterSetName = "Upper")]
        [ValidateSet(":", "None", ".", "-")]
        $Separator,
		
        [Parameter(ParameterSetName = "Upper")]
        [Switch]$Uppercase,
		
        [Parameter(ParameterSetName = "Lower")]
        [Switch]$Lowercase
    )
	
    BEGIN {
	    # Initial cleanup of the input
	
	    #Replace Dash
	    $MACAddress = $MACAddress -replace "-", ""

	    #Replace Colon
	    $MACAddress = $MACAddress -replace ":", ""

	    #Remove whitespace
	    $MACAddress = $MACAddress -replace "/s", ""

	    #Remove whitespace
	    $MACAddress = $MACAddress -replace " ", ""

	    #Remove dots
	    $MACAddress = $MACAddress -replace "\.", ""

	    #Remove space at the beginning
	    $MACAddress = $MACAddress.trim()

	    #Remove space at the end
	    $MACAddress = $MACAddress.trimend()
    }
    PROCESS {
        IF ($PSBoundParameters['Uppercase']) {
            $MACAddress = $MACAddress.toupper()
        }
        IF ($PSBoundParameters['Lowercase']) {
            $MACAddress = $MACAddress.tolower()
        }	
        IF ($PSBoundParameters['Separator']) {
            IF ($Separator -ne "None") {
                $MACAddress = $MACAddress -replace '(..(?!$))', "`$1$Separator"
            }
        }
    }
    END {
        Write-Output $MACAddress
    }
}

Format-MACAddress -MACAddress "aa:ab:22:33:44:55"
Format-MACAddress -MACAddress "aa:ab:22:dD:ee:FF" -Uppercase
Format-MACAddress -MACAddress "aa:ab:22:dD:ee:FF" -Lowercase
Format-MACAddress -MACAddress "aa:ab:22:dD:ee:FF" -Lowercase -Separator "-"
Format-MACAddress -MACAddress "aa:ab:22:dD:ee:FF" -Uppercase -Separator "."
Format-MACAddress -MACAddress "aa:ab:22:dD:ee:FF" -Lowercase -Separator :
