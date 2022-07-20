[string]$t = ''
[regex]::replace($t.ToLower(), '(^|_)(.)', { $args[0].Groups[2].Value.ToUpper()})

# OR

$Text = $Var1 -Replace '[^0-9,A-Z]', ' '
(Get-Culture).TextInfo.ToTitleCase($Text) -Replace ' '
