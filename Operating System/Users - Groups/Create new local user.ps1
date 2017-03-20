# Basic user data
$User_Username = "test-user"
$User_Fullname = "Test User"
$User_Description = "Test user created via Powershell"
 
# Enter credentials
$User_Credentials = Get-Credential -Message "Please enter the password for the new user" -UserName $User_Username
 
# Create new user
$NewUser = New-LocalUser -Name $User_Username -FullName $User_Fullname -Description $User_Description -Password $User_Credentials.Password -AccountNeverExpires -PasswordNeverExpires -UserMayNotChangePassword
