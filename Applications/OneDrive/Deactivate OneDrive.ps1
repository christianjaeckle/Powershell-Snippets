$Reg_Key = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\OneDrive"
$Reg_Property = "DisableFileSyncNGSC"

New-Item -Path $RegKey -Force
Set-ItemProperty -Path $RegKey -Name $Reg_Property -Value "1"
