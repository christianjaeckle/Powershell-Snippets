$File = Get-Content "X:\File.txt"
$File = $File[1..($File.count - 1)]
$File > "X:\File New.txt"
