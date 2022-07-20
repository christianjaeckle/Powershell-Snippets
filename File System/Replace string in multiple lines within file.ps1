$File_Original = "$env:USERPROFILE\Desktop\ApplicationResources_de.properties"
$File_Updated = "$File_Original.csv"

$Content = Get-Content $File_Original
$Content | ForEach-Object { $_ -Replace('(^\w*)(\=\s)(.*)','"$1";"$3";') } | Set-Content $File_Updated
