# Set ReadOnly / write protected attribute
Set-ItemProperty -Path (Join-Path -Path $env:Userprofile -ChildPath 'Desktop\File.txt') -Name Attributes -Value ((Get-ItemProperty (Join-Path -Path $env:Userprofile -ChildPath 'Desktop\File.txt')).Attributes -bor [System.IO.FileAttributes]::ReadOnly)
