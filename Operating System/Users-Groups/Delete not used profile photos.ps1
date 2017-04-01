# Get file name for current user from Registry
[string]$strCurrentPhoto = (Get-Item "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AccountPicture").GetValue("SourceID")

# Delete all files except the current one
Get-ChildItem -Path "$env:appdata\Microsoft\Windows\AccountPictures\*" -Include "*.accountpicture-ms" | Where-Object {$_.Name -NotMatch $strCurrentPhoto} | Remove-Item
