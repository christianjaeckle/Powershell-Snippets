$Original = "$env:USERPROFILE\Desktop\Resources_de.properties"
$Updated = "$env:USERPROFILE\Desktop\Resources_de.bak.properties"

$Content = Get-Content $Original
$Content.Replace("Ä", "\u00C4").Replace("ä", "\u00E4").Replace("Ö", "\u00D6").Replace("ö", "\u00F6").Replace("Ü", "\u00DC").Replace("ü", "\u00FC").Replace("ß", "\u00DF") | Set-Content $Updated
