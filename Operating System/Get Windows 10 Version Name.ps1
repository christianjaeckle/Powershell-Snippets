$RegKey = 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion'
$WinProNameNew = (Get-ItemProperty -Path $RegKey -Name 'DisplayVersion')


if($WinProNameNew) {
    # Windows 10 version 20H2 or newer
    $WinProNameNew.DisplayVersion
} else {
    # Windows 10 versions 2004 and older
    Get-ItemProperty -Path $RegKey -Name 'ReleaseId'
}
