# calculate the current time from current timezone in UTC.
(Get-Date).ToUniversalTime()

# OR
#[System.TimeZoneInfo]::ConvertTimeBySystemTimeZoneId([DateTime]::Now, "UTC")
