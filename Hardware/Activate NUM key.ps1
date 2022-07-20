# Dauerhafte Aktivierung der NumLock-Taste vor der Benutzeranmeldung
Set-ItemProperty -Path "Microsoft.PowerShell.Core\Registry::HKU\.DEFAULT\Control Panel\Keyboard" -Name InitialKeyboardIndicators -Value 2

# Dauerhafte Aktivierung der NumLock-Taste nach der Benutzeranmeldung
Set-ItemProperty -Path "Microsoft.PowerShell.Core\Registry::HKCU\Control Panel\Keyboard" -Name InitialKeyboardIndicators -Value 2
