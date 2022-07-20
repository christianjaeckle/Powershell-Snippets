# From Base64 to string
$pwd = [Convert]::FromBase64String('RWluIFRlc3Q=')
[System.Text.Encoding]::UTF8.GetString($pwd)

# Back
$pwd =[System.Text.Encoding]::UTF8.GetBytes('Ein Test')
[Convert]::ToBase64String($pwd)
