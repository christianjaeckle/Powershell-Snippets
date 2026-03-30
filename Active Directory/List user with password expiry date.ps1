# List users with password expiry date
Get-ADUser -Filter { Enabled -eq $true -AND PasswordNeverExpires -eq $False } –Properties 'Samaccountname', 'msDS-UserPasswordExpiryTimeComputed' | Select-Object -Property "Samaccountname", @{ Name = 'Expiry';Expression={ [datetime]::FromFileTime($_.'msDS-UserPasswordExpiryTimeComputed') }}
