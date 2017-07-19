$Address = Read-Host "Internet or network address"
$Username = Read-Host "Username"
$Password = Read-Host "Password" -AsSecureString

If($Address -and $Username)
{
    [string]$ExeResult = ""

    # Try to add credentials
	If($Password)
	{
        $ExeResult = Start-Process -FilePath "$env:windir\System32\cmdkey.exe" -ArgumentList "/add:$Address /user:$Username /pass:$Password"
	}
	Else
	{
		$ExeResult = Start-Process -FilePath "$env:windir\System32\cmdkey.exe" -ArgumentList "/add:$Address /user:$Username"
	}

    # Get result
	If($ExeResult -match "The command line parameters are incorrect")
	{
		Write-Error "Failed to add credentials to Windows vault."
	}
	ElseIf($ExeResult -match "CMDKEY: Credential added successfully")
	{
		Write-Host "Credentials added successfully."
	}
}
Else
{
	Write-Error "The internet / network address and the username are mandatory."
}
