# Get the last day of the current month
((Get-Date -Day 1 -Hour 0 -Minute 0 -Second 0)).AddMonths(1).AddSeconds(-1)
