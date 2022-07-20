# some email address
$mail = 'THOMAS.börßen_senbÖrg@test.com'
# list of legal characters, inverted by "^"
$pattern = '[^a-z0-9\.@]'

# find all matches, case-insensitive
$allMatch = [regex]::Matches($mail, $pattern, 'IgnoreCase')
# create list of invalid characters
$invalid = $allMatch.Value | Sort-Object -Unique 

'Illegal characters found: {0}' -f ($invalid -join ', ')
