# Variables
$Restore_Path = 'E:\'

if (Test-Path -Path $Restore_Path) {
	Restore-GPO -All -Domain 'DOMAINNAME' -Path $Restore_Path
}
else {
	Write-Host 'Restore folder not found!'
}
