Function WindowsUpdates {
	try {
		$objSitzung = New-Object -ComObject Microsoft.Update.Session
		$objUpdateSuche = $objSitzung.CreateUpdateSearcher()
		$objSuchErgebnisse = $objUpdateSuche.Search("IsInstalled=0 AND isHidden=1")
		$objSuchErgebnisse.Updates
	} catch {
			Write-Warning -Message "The following error occurred: $($_.Exception.Message)"
	}
}

WindowsUpdates | Select-Object Title, IsInstalled, IsDownloaded, IsUninstallable, IsHidden | Format-Table
