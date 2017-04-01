#Requires -Version 5

# Define variables
$SourceDir = "$env:userprofile\AppData\Roaming\Microsoft\Windows\SendTo"
$TargetDir = "$env:userprofile\Desktop"
$TargetFileName = "Backup - SendTo.zip"
$TargetFilePath = Join-Path -Path $TargetDir -ChildPath $TargetFileName

# Start compression
$TargetFile = Compress-Archive -Path "$SourceDir\*" -DestinationPath $TargetFilePath -CompressionLevel Optimal
