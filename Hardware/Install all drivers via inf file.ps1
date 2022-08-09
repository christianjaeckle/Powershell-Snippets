# Install all drivers recursively
Get-ChildItem -Filter *.inf -Recurse | Select-Object FullName | ForEach-Object { pnputil.exe -a $_.FullName }
