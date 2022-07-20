$myString = "STRing WITH Mixed CaSe"

# Convert string to lowercase
$myString = $myString.ToLower()

(Get-Culture).TextInfo.ToTitleCase($myString)

# OR

$First, $Rest = $Var2 -Replace '[^0-9,A-Z]', ' ' -Split ' ',2
$First.Tolower() + (Get-Culture).TextInfo.ToTitleCase($Rest) -Replace ' '
