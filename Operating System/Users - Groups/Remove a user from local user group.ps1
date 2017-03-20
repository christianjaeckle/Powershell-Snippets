# Remove user "TestUser" from local user Group "Administrators".
Remove-LocalGroupMember -Group "Administrators" -Member "TestUser"
