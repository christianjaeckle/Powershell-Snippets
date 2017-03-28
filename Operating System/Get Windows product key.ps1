<#
.Synopsis
   Enumerates the Windows ProductKey
.DESCRIPTION
   Enumerates the Windows ProductKey from the DigitalProductId out of the Registry.
.EXAMPLE
   Get-WindowsProductKey
#>
function Get-WindowsProductKey
{
    [CmdletBinding()]
    [Alias()]
    [OutputType([string])]
    Param()

    Begin
    {
        # Define variables
        [string]$ProductKey = ""
        $Characters = ("B","C","D","F","G","H","J","K","M","P","Q","R","T","V","W","X","Y","2","3","4","6","7","8","9")
    }
    Process
    {
        # Read ProductID from Registry
        $RegKeyResult = Get-ItemProperty -Path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion" -Name "DigitalProductId"
        $binArray = ($RegKeyResult.DigitalProductId)[52..66]
        
        For ($i = 24; $i -ge 0; $i --) {
            $n = 0
            
            For ($j = 14; $j -ge 0; $j --) {
                $n = $n * 256 -bxor $binArray[$j]

                $binArray[$j] = [math]::truncate($n / 24)
                
                $n = $n % 24
            }
            
            $ProductKey = $Characters[$n] + $ProductKey
            
            If (($i % 5 -eq 0) -and ($i -ne 0)) {
                $ProductKey = "-" + $ProductKey
            }
        }
    }
    End
    {
        Return $ProductKey
    }
}

Get-WindowsProductKey
