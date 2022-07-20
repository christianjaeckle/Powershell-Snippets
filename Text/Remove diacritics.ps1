function Remove-Diacritics([string]$String)
{
    $objD = $String.Normalize([Text.NormalizationForm]::FormD)
    $sb = New-Object Text.StringBuilder

    for ($i = 0; $i -lt $objD.Length; $i++) {
        $c = [Globalization.CharUnicodeInfo]::GetUnicodeCategory($objD[$i])
        if($c -ne [Globalization.UnicodeCategory]::NonSpacingMark) {
          [void]$sb.Append($objD[$i])
        }
      }

    return("$sb".Normalize([Text.NormalizationForm]::FormC))
}
