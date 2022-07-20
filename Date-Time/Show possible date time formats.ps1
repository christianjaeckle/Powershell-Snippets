$date = date
$date.GetDateTimeFormats()

# Show index
$date = date
for ( $i = 0; $i -ne $date.GetDateTimeFormats().Count; $i++ ) {"Index $($i) Format: $($date.GetDateTimeFormats()[$i])" }

# How to use index
$date = date
$date.GetDateTimeFormats()[22] # Output: Mittwoch, 28. August 2013 13:07:17
