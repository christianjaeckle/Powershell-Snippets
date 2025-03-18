(Get-ItemProperty -Path (Join-Path -Path $env:Userprofile -ChildPath 'Desktop\File.txt')).Attributes

# Output: ReadOnly, Archive
