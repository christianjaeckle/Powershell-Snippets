[string]$CMenuLabel = "Notepad"
[string]$RegKey = "HKCR:\Directory\Background\shell"

# Create new drive for reg root
New-PSDrive -Name "HKCR" -PSProvider Registry -Root "HKEY_CLASSES_ROOT" | Out-Null

# Check if regkey already exists
if(Test-Path -Path "$RegKey\$CMenuLabel") {
    # Remove key
    Remove-Item -Path "$RegKey\$CMenuLabel" -Recurse
    
    # Check if regkey still exists
    if(Test-Path -Path "$RegKey\$CMenuLabel") {
        Write-Verbose -Message "Failed to delete '$CMenuLabel'."
    }
    else {
        Write-Verbose -Message "Successfully deleted '$CMenuLabel'."
    }
} else {
    Write-Verbose -Message "Could not find '$CMenuLabel'."
}

# Remove drive
Remove-PSDrive -Name "HKCR"
