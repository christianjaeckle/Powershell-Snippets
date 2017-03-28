[string]$CMenuLabel = "Notepad"
[string]$CMenuApp = "$env:windir\Notepad.exe"
[string]$RegKey = "HKCR:\Directory\Background\shell"

# Create new drive for reg root
New-PSDrive -Name "HKCR" -PSProvider Registry -Root "HKEY_CLASSES_ROOT" | Out-Null

# Check if regkey already exists
if(Test-Path -Path "$RegKey\$CMenuLabel") {
	Write-Verbose -Message "The registry key already exists."
}
else
{
	# Create new keys & properties
	New-Item -Path $RegKey -Name $CMenuLabel | Out-Null
    Set-ItemProperty -Path "$RegKey\$CMenuLabel" -Name "(Default)" -Value $CMenuLabel | Out-Null

	New-Item -Path "$RegKey\$CMenuLabel" -Name "command" | Out-Null
	Set-ItemProperty -Path  "$RegKey\$CMenuLabel\Command" -Name "(Default)" -Value $CMenuApp | Out-Null
    
    # Check if added successfully
	if(Test-Path -Path $RegKey) {
        Write-Verbose -Message "Added '$CMenuLabel' successfully."
    }
	else {
        Write-Verbose -Message "Could not add '$CMenuLabel'!"
	}
}

# Remove drive
Remove-PSDrive -Name "HKCR"
