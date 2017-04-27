# Create new Outlook instance
$comOutlook = new-object -com Outlook.Application

# Define contact folder
$objContacts = $comOutlook.Session.GetDefaultFolder(10)

# Outlput
$objContacts.Items | select-object Categories,FullName,MobileTelephoneNumber,LastModificationTime,Sensitivity | format-table
