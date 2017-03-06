# Variables
[string]$WorkDirectory = "$env:userprofile\Desktop"

# Enumerate reg files in directory
Get-ChildItem $WorkDirectory -Filter *.reg | ForEach-Object {
    # Import reg file via regedit.exe
    Start-Process -FilePath "$env:windir\regedit.exe" -ArgumentList "/s `"$($_.FullName)`"" -WorkingDirectory $WorkDirectory -WindowStyle Normal
}
