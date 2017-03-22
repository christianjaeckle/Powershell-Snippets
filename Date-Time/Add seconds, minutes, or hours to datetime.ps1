[datetime]$tmp = Get-Date "01.01.1970 00:00:00" -format "dd.MM.yyyy hh:mm:ss"

# Add seconds
$tmp.AddSeconds(165789464)

# Add minutes
$tmp.AddMinutes(2054)

# Add hours
$tmp.AddHours(230)
