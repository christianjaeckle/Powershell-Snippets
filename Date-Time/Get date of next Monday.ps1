Function Get-DateOfNextMonday {
    # Find the date of the next Monday.
    param (
    )
    
    # Define variables
    [Integer]$intZaehler = 0
    
    while ($intZaehler -lt 7) {
        # Check if the current day + loop number is a Monday.
        if ((Get-Date).AddDays($intZaehler).DayOfWeek -eq "Monday") {
            # Return the date if is a Monday
            return ((Get-Date).AddDays($intZaehler))
        }

        $intZaehler++
    }
}
