#Requires -RunAsAdministrator

# Rename the local user group from "TestGroup" to "TestGroupRenamed"
Rename-LocalGroup -Name "TestGroup" -NewName "TestGroupRenamed"
