# Create action which defines the application to executed
$Action = New-ScheduledTaskAction -Execute "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" -Argument "-NonInteractive -NoLogo -NoProfile -File 'C:\Windows\temp\script.ps1'"

# Create a daily trigger for 1am
$Trigger = New-ScheduledTaskTrigger -Daily -At "1AM"

# Create the scheduled task object
$Task = New-ScheduledTask -Action $Action -Trigger $Trigger -Settings (New-ScheduledTaskSettingsSet)

# Register the new scheduled task
$Task | Register-ScheduledTask -TaskName "Example task"
