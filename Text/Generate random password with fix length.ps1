# Define amount of characters
[int]$PasswordLength = 12

-join ("ABCDEFGHIJKLMNOPQRSTUVWXYZÄÖÜabcdefghijklmnopqrstuvwxyzäöü0123456789-_".ToCharArray() | Get-Random -Count $PasswordLength)
