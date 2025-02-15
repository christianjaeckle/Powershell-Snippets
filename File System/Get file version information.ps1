$File = 'C:\Windows\Notepad.exe'

(Get-ItemProperty -Path $File).VersionInfo
