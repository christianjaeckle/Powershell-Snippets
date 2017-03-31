Get-ChildItem -Path "$env:windir" -Filter *.exe | Get-Random

# Or multiple files
 	
Get-ChildItem -Path "$env:windir" -Filter *.exe | Get-Random -count 3
