[int]$PwdLength = 10
[int]$PwdComplexity = 4
[string]$Password = $null
[string[]]$Characters = "abcdefghijklmnopqrstuvwxyz", "ABCDEFGHIJKLMNOPQRSTUVWXYZ", "1234567890", "[]{}<>@#~?!£$%^&*()"

foreach($Iteration in 1..$PwdLength) {
    $Set = Get-Random $PwdComplexity
    $Position = Get-Random $Characters[$Set].Length
    
    $Password = $Password + [char]($Characters[$Set].SubString($Position, 1))
}

Write-Host $Password
