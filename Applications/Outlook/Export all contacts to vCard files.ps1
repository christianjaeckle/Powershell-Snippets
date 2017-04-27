# New COM object
$comOutlook = new-object -com Outlook.Application
 
# Define contact folder
$objKontakte = $comOutlook.Session.GetDefaultFolder(10)
 
# Enumerate through contacts
foreach ($objKontakt in $objKontakte.Items) {
    # Define place to store files
    $strDateiname = "$env:userprofile\Desktop\" + $objKontakt.FirstName + " " + $objKontakt.LastName + ".vcf"
    
    # Save contact as file
    $objKontakt.SaveAs( $strDateiname, 6)
}
