# Define drive letter, here system drive, mostly C:
[string]$DriveLetter = "$env:systemdrive"

# Disable restore points
Disable-ComputerRestore -Drive $DriveLetter -Verbose
