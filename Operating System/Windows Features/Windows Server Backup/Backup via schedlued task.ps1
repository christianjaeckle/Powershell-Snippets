# Define script which should be executed
$ST_Action = New-ScheduledTaskAction -Execute 'C:\Scripts\Backup.cmd'
# Define when script should be executed
$ST_Trigger = New-ScheduledTaskTrigger -Weekly -DaysOfWeek Saturday -At 10pm
$ST_Setting = New-ScheduledTaskSettingsSet
# Define user context which will be used to execute the script
$ST_Principal = New-ScheduledTaskPrincipal -UserId 'Administrator' -LogonType S4U

$ST_Task = New-ScheduledTask -Action $ST_Action -Trigger $ST_Trigger -Settings $ST_Settings -Principal $ST_Principal
Register-ScheduledTask -TaskName "Backup" -InputObject $ST_Task -Force
