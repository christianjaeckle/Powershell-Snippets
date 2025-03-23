# What time is it in Tokyo?
[System.TimeZoneInfo]::ConvertTimeBySystemTimeZoneId([DateTime]::Now, "Tokyo Standard Time")

# And in Arizona?
[System.TimeZoneInfo]::ConvertTimeBySystemTimeZoneId([DateTime]::Now, "US Mountain Standard Time")
