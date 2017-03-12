#Requires -Version 5

# Exports the current layout of the Windows start menu to a xml file which could be imported via group policy editor.
Export-StartLayout -Path "$env:userprofile\Desktop\Backup - Start Menu Layout.xml"
