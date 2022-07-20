Read byte-wise to Base64
$b = Get-Content -Encoding Byte -Path .\cert.pfx
[Convert]::ToBase64String($b) > .\cert.b64

$dec = [Convert]::FromBase64String((Get-Content -Path .\cert.b64))
[IO.File]::WriteAllBytes('.\new.pfx', $dec)
