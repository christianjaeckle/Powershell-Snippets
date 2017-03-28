$Path_Fonts = "$env:windir\Fonts"
$Path_Target = "$env:userprofile\Desktop"
$File_Name = "Fonts - Backup.zip"
$File_Archive = Join-Path -Path $Path_Target -ChildPath $File_Name

# Check if archive file already exists
if(Test-path $File_Archive) {
    # Remove archive file
	Remove-item -Path $File_Archive
}

# Compress fonts into archive
Add-Type -assembly "system.io.compression.filesystem"
[io.compression.zipfile]::CreateFromDirectory($Path_Fonts, $File_Archive)
