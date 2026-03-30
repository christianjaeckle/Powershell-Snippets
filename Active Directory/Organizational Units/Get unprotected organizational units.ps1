Get-ADOrganizationalUnit -filter * -Properties ProtectedFromAccidentalDeletion | Where-Object { $_.ProtectedFromAccidentalDeletion -eq $false } | Format-Table Name, DistinguishedName
