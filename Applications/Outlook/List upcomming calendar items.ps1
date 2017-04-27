Function Get-OutlookAppointments {
	param (
		[DateTime] $datRangeStart = [DateTime]::Now,
		[DateTime] $datRangeEnd = [DateTime]::Now.AddDays(7)
	)
	
	# Create Outlook instance
	$comOutlook = new-object -ComObject Outlook.Application
	$objOutlSession = $comOutlook.Session
	$objOutlSession.Logon()
	
	# Select calendar
	$objOutlFolderCalendar = 9
	
	# Get items and sort them
	$objAppointmItems = $objOutlSession.GetDefaultFolder($objOutlFolderCalendar).Items
	$objAppointmItems.Sort("[Start]")
	$objAppointmItems.IncludeRecurrences = $true
	
	# Define filter
	$strRestrictions = "[End] &gt;= '{0}' AND [Start] &lt; = &#039;{1}&#039;&quot; -f $datRangeStart.ToString(&quot;g&quot;), $datRangeEnd.ToString(&quot;g&quot;)
	
	# Execute filter and define output
	foreach($objAppointment in $objAppointmItems.Restrict($strRestrictions)) {
		&quot;{0:dd.MM.yyyy HH:mm} - {1:dd.MM.yyyy HH:mm}: {2} ({3})&quot; -f [DateTime]$objAppointment.Start, [DateTime]$objAppointment.End, $objAppointment.Subject, $objAppointment.Location
	}
	
	# Close Outlook session
	$comOutlook = $objOutlSession = $null;
}

Get-OutlookAppointments
