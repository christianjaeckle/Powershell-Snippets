#Requires -RunAsAdministrator

# Add user "TestUser" to local user Group "Administrators".
Add-LocalGroupMember -Group "Administrators" -Member "TestUser"
