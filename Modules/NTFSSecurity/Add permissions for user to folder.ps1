# Add "Full" permissions for user "UserX" to folder "Example"
Add-NTFSAccess -Path = 'C:\Example' -AccessRights = 'FullControl' -Account = 'UserX'
