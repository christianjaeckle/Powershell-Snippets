[string]$strRegPath = 'HKEY_CLASSES_ROOT\Installer\Products'
[string]$strProductCode = 'DA01CDE2-2255-4D4E-8B6A-5864079DAF22'
[string]$strProductCodeSpec = ''

function Get-ReverseString {
    [CmdletBinding()]
    param (
        [string]$Text
    )
    
    [array]$ReturnValue = $Text.ToCharArray()
    [array]::Reverse($ReturnValue)
    Return -join $ReturnValue
}

function Convert-ByteWiseNibbleChange {
    [CmdletBinding()]
    param (
        [string]$Text
    )

    Return ([Regex]::Matches($Text, "(..)") | `
            ForEach-Object { [Convert]::ToByte($_.Value, 16) } ` | `
            ForEach-Object { (($_ -band 0xf0) -shr 4) -bor (($_ -band 0x0f) -shl 4) } | `
            ForEach-Object { $_.ToString('X2') }) -join ''
}

$strProductCodeSpec = Get-ReverseString(($strProductCode.Substring(0, 8)))
$strProductCodeSpec += Get-ReverseString(($strProductCode.Substring(9, 4)))
$strProductCodeSpec += Get-ReverseString(($strProductCode.Substring(14, 4)))
$strProductCodeSpec += Convert-ByteWiseNibbleChange($strProductCode.Substring(19, 4))
$strProductCodeSpec += Convert-ByteWiseNibbleChange($strProductCode.Substring(24, 12))

Test-Path -Path (Join-Path -Path $strProductCodeSpec -ChildPath $strRegPath) -PathType Container -IsValid
