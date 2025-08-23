# Get NTFS folder permissions without inherited ones
Get-NTFSAccess -Path 'D:\Example' –ExcludeInherite | Format-Table -AutoSize
