# Hide notifications from the synchronization provider within the File Explorer in Windows 10.

$Key = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
$Name = "ShowSyncProviderNotifications"
$Type = "DWord"
$Value = "0"

# Check if property already exist
if((Get-ItemProperty -Path $Key -Name $Name -ErrorAction SilentlyContinue).$Name) {
	# Get old value
	$ValueOld = Get-ItemProperty -Path $Key -Name $Name
	Write-Verbose -Message "Property already exists: $ValueOld"
    
    # Remove existing value
    Remove-ItemProperty -Path $Key -Name $Name
    Write-Verbose -Message "Property removed."
}
else
{
    Write-Verbose -Message "Property doesn't exist."
}

# Add property
New-ItemProperty -Path $Key -Name $Name -PropertyType $Type -Value $Value -Force
