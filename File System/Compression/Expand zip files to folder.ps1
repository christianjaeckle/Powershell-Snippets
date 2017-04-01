#Requires -Version 5

# Define variables
$SourceFile = "$env:userprofile\Desktop\Example.zip"
$TargetDir = "$env:userprofile\Desktop\Example"

# Create example directory if needed
if(-not (Test-Path -Path $TargetDir -PathType Container)) {
    New-Item -Path $TargetDir -ItemType Directory
}

# Start to expand
Expand-Archive $SourceFile -DestinationPath $TargetDir
