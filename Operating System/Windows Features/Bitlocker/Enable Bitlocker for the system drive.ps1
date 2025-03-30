# Enable Bitlocker for the system drive
Enable-BitLocker -MountPoint $env:SystemDrive -EncryptionMethod 'AES256' -UsedSpaceOnly:$true -RecoveryPasswordProtector:$true

# Get the recovery password (needs to be done before the first restart of the computer!)
(Get-BitLockerVolume | Where-Object { $_.KeyProtector -eq 'RecoveryPassword' }).RecoveryPassword
