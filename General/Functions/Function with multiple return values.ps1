Function Get-MultipleValues() {
	# Define variable
	[hashtable]$Ergebnis = @{}
	
	# Define return values
	$Ergebnis.Erfolgreich = $True
	$Ergebnis.Wert = 100
	
	# Return result
	Return $Ergebnis
}
