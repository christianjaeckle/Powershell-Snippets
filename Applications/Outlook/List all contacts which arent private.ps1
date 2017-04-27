# New COM object
$comOutlook = new-object -com Outlook.Application
 
# Define folder
$objContacts = $comOutlook.Session.GetDefaultFolder(10)
 
# Filter contacts
$objContacts.Items | select-object FullName, Sensitivity | Where-Object {$_.Sensitivity -eq 0}
