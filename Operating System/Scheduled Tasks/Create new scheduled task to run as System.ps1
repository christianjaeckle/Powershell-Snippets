# Create action which defines the application / script to executed
$Action = New-ScheduledTaskAction -Execute "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" -Argument "-NonInteractive -NoLogo -NoProfile -File 'C:\Windows\Temp\ScheduledTask_System.ps1'"

# Create principle
$Principal = New-ScheduledTaskPrincipal -UserId SYSTEM

# Create the scheduled task object
$Task = New-ScheduledTask -Action $Action -Principal $Principal

# Register the new scheduled task
$RegTask = $Task | Register-ScheduledTask -TaskName 'Run script in system context'

# Run scheduled task
#$RegTask | Start-ScheduledTask
