# Load Assembly
#[system.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") | Out-Null

# Create forms object
$Notifca = New-Object System.Windows.Forms.NotifyIcon

# Get path of current process
$Path = Get-Process -id $Pid | Select-Object -ExpandProperty Path

# Get icon of current process
$Icon = [System.Drawing.Icon]::ExtractAssociatedIcon($Path)

# Set properties of baloon tip
$Notifca.Icon = $Icon
$Notifca.BalloonTipIcon = "Info"
$Notifca.BalloonTipText = "This is a demo notification"
$Notifca.BalloonTipTitle = "Title"
$Notifca.Visible = $true

# Show tip
$Notifca.ShowBalloonTip(5000)
