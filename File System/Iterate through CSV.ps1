$CSVContent = Import-Csv -Path "$env:USERPROFILE\Desktop\Groups.csv" -Delimiter ";"

$CSVContent | Foreach-Object {
    foreach ($Line in $_.PSObject.Properties) {
        Write-Verbose $Line.Value

        #Execute script with $Line.Value as group parameter
    }
}
