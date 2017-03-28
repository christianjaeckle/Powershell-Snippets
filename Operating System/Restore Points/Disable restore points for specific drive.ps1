[string]$DriveLetter = "$env:systemdrive"

Disable-ComputerRestore -Drive $DriveLetter -Verbose
