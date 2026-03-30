# Variables
$Backup_Date = (Get-Date).ToString('yyyyMMdd')
$Backup_Path = (Join-Path -Path 'E:\' -ChildPath (-join ($Backup_Date, ' - GPOs')))

# Show GPOs
Get-GPO -All | Select-Object Id,DisplayName,GpoStatus | Sort-Object DisplayName

if(-not(Test-Path -Path $Backup_Path)) {
	New-Item -Path $Backup_Path -ItemType Directory
}

# Backup GPOs
Get-GPO -All | Foreach-Object {
	# Create backup folder per policy
	if(-not(Test-Path -Path (Join-Path $Backup_Path -ChildPath $_.DisplayName))) {
		New-Item -Path (Join-Path $Backup_Path -ChildPath $_.DisplayName) -ItemType Directory
	}
	
	# Save backup of policy to folder
	Backup-Gpo -Guid $_.Id -Path (Join-Path $Backup_Path -ChildPath $_.DisplayName) -Comment $_.DisplayName
}
