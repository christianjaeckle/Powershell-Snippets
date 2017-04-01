Get-Date

# Shows current date
Get-Date -DisplayHint Date

# Shows current date in format "Montag, 21. September 2015"
(Get-Date).ToString("D")

# Shows current date in format "21.09.2015"
(Get-Date).ToString("d")

# Shows current time
Get-Date -DisplayHint Time

# Shows current time in format "13:45:30"
(Get-Date).ToString("T")

# Shows current date with time
Get-Date -DisplayHint DateTime

# Shows current date with time in format "21.09.2015 13:45"
(Get-Date).ToString("g")

# Shows current short date and short time
Get-Date -Format g

# Shows current short date and short time in format "2015-09-21T13:44:56"
(Get-Date).ToString("s")

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
