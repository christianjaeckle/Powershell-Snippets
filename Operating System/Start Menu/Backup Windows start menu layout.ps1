#Requires -Version 5

# Define variables
$SourceDir = "$env:userprofile\AppData\Local\TileDataLayer\Database"
$TargetDir = "$env:userprofile\Desktop"
$TargetFile = "Backup - StartMenuLayout.zip"
$TargetFilePath = Join-Path -Path $TargetDir -ChildPath $TargetFile

Compress-Archive -Path "$SourceDir\*" -DestinationPath $TargetFilePath -CompressionLevel Optimal
