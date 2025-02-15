$PasswordNew = Read-Host -Prompt "Please enter the new password" -AsSecureString
$objUser = Get-LocalUser -Name Test
$objUser | Set-LocalUser -Password $PasswordNew
