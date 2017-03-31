# List available timezones.
Get-TimeZone -ListAvailable

# or
#[System.TimeZoneInfo]::GetSystemTimeZones() | Select-Object Id, DisplayName, BaseUtcOffset, SupportsDaylightSavingTime
