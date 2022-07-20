param (
    [DateTime] $RangeStart = [DateTime]::Now,
    [int] $RangeWeeks = 0
)

$comOutlook = New-Object -ComObject Outlook.Application

$objSession = $comOutlook.Session
$objSession.Logon()
$objCalendar = 9

$CalendarItems = $objSession.GetDefaultFolder($objCalendar).Items
$CalendarItems.Sort('[Start]')
$CalendarItems.IncludeRecurrences = $true
$RangeEnd = [DateTime]::Now.AddDays(7 * $RangeWeeks);

while (! ($RangeEnd.dayOfWeek -eq 'Sunday') ) {
    $RangeEnd = $RangeEnd.AddDays(1)
}

Write-Host 'Start date: ' $RangeStart
Write-Host 'End date: ' $RangeEnd
Write-Host " "

$Restrictions = "[End] >= '{0}' AND [Start] <= '{1}'" -f $RangeStart.ToString("g"), $RangeEnd.ToString('g')
$Categories = @()
$CategoriesSummary = @{}
    
foreach ($CalendarItem in $CalendarItems.Restrict($Restrictions)) {
    $di = [Globalization.DateTimeFormatInfo]::CurrentInfo
        
    $CalendarItemWeek = $di.Calendar.GetWeekOfYear($CalendarItem.start, $di.CalendarWeekRule, $di.FirstDayOfWeek)
        
    if (! ($CategoriesSummary.keys -contains $CalendarItemWeek) ) {
        $CategoriesSummary.add($CalendarItemWeek , @{})
    }
        
    if (! ($CategoriesSummary[$CalendarItemWeek].keys -contains $CalendarItem.categories) ) {
        $CategoriesSummary[$CalendarItemWeek].add($CalendarItem.categories, 0)
    }
        
    $CategoriesSummary[$CalendarItemWeek][$CalendarItem.categories] = $CategoriesSummary[$CalendarItemWeek][$CalendarItem.categories] + ([int]$CalendarItem.duration / 60)
}
    
foreach ($week in ($CategoriesSummary.keys | Sort-Object)) {
    $weekHours = ($CategoriesSummary[$week].values | Measure-Object -sum).sum
    Write-Host 'Week' $week "(Total Hours:" ($CategoriesSummary[$week].values | Measure-Object -sum).sum")"
        
    $CategoriesSummaryWeek = @()
        
    foreach ($category in $CategoriesSummary[$week].keys) {
        $categorySummaryWeek = @{}
        $categorySummaryWeek.Category = $category
        $categorySummaryWeek.Hours = ($CategoriesSummary[$week][$category] | Measure-Object -sum).sum
        $categorySummaryWeek.Percentage = "{0:P0}" -f (($CategoriesSummary[$week][$category] | Measure-Object -sum).sum / $weekHours)
        $CategoriesSummaryWeek += New-Object psobject -property $categorySummaryWeek | Select-Object Category, Hours, Percentage
    }
        
    $CategoriesSummaryWeek
}
