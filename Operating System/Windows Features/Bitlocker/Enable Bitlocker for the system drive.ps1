# Enable Bitlocker for the system drive
Enable-BitLocker -MountPoint $env:SystemDrive -EncryptionMethod 'XtsAes256' -UsedSpaceOnly:$false -RecoveryPasswordProtector:$true

# Get the recovery password (needs to be done before the first restart of the computer!)
(Get-BitLockerVolume).KeyProtector.RecoveryPassword
