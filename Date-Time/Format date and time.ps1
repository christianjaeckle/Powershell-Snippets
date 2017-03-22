Get-Date

# Shows current date
Get-Date -DisplayHint Date

# Shows current time
Get-Date -DisplayHint Time

# Shows current date with time
Get-Date -DisplayHint DateTime

# Shows current short date and short time
Get-Date -Format g

# Shows current date in specific format
Get-Date -format "yyyyMMdd"

# Shows current date and time in specific format
Get-Date -format "dd-MM-yyyy hh:mm:ss"

# Shows current date and time in specific format
Get-Date -format "yyyy-MM-dd hh:mm:ss"

# Shows specific date and time in standard format
Get-Date -Date "01.01.1970 00:00:00"

# 
Get-Date -UFormat "%Y / %m / %d / %A / %Z"
