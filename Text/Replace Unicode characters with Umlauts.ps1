$Original = "$env:USERPROFILE\Desktop\Resources_de.properties"
$Updated = "$env:USERPROFILE\Desktop\Resources_de.properties"

$Content = Get-Content $Original
$Content.Replace("\u00C4", "Ä").Replace("\u00E4", "ä").Replace("\u00D6", "Ö").Replace("\u00F6", "ö").Replace("\u00DC", "Ü").Replace("\u00FC", "ü").Replace("\u00DF", "ß") | Set-Content $Updated
