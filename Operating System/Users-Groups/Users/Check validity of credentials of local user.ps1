$strUsername = 'Test'
$strPassword = 'MyT3stPwd'
$strLocalComputer = $env:COMPUTERNAME

Add-Type -AssemblyName System.DirectoryServices.AccountManagement
$objDirectorServ = New-Object System.DirectoryServices.AccountManagement.PrincipalContext('machine', $strLocalComputer)
$objDirectorServ.ValidateCredentials($strUsername, $strPassword)
