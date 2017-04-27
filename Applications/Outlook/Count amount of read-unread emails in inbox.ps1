# Create new Com objekt
$comOutlook = New-Object -com Outlook.Application

# Define workspace
$objOutlNameSpace = $comOutlook.GetNamespace("MAPI")
$objOutlSession = $objOutlNameSpace.Session

$objPosteingang = $objOutlSession.GetDefaultFolder(6)

# Count mails
$intAnzahlMails = (%{$objPosteingang.Items }).Count
$intAnzahlUngelMails = (%{$objPosteingang.Items | Where-Object {$_.UnRead}}).Count

# Output
Write-Host ("$intAnzahlMails emails within Inbox, $intAnzahlUngelMails unread.")
