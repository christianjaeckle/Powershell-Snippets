$UserProfiles = Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList\*' | Where-Object { $_.PSChildName -match 'S-1-5-21-(\d+-?){4}$' } | Select-Object @{Name = 'SID'; Expression = { $_.PSChildName } }, @{Name = 'ProfileFile'; Expression = { "$($_.ProfileImagePath)\NTuser.dat" } }

# Loop through each user profile on local computer
foreach ($UserProfile in $UserProfiles) {
    # Load NTUser.dat if it's not already loaded
    if (($ProfileWasLoaded = Test-Path -Path "Registry::HKEY_USERS\$($UserProfile.SID)") -eq $false) {
        Start-Process -FilePath 'Cmd.exe' -ArgumentList "/C Reg.exe LOAD HKU\$($UserProfile.SID) $($UserProfile.ProfileFile)" -Wait -WindowStyle Hidden
    }

    # Change some regsitry value
    $reg = New-ItemProperty "Registry::HKEY_USERS\$($UserProfile.SID)\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name 'ShowStatusBar' -Value '1' -PropertyType Dword -Force

    try {
        $reg.Handle.Close() 
    }
    catch {
    }

    # Unload NTUser.dat
    if ($ProfileWasLoaded -eq $false) {
        [GC]::Collect()
        Start-Sleep 1
        Start-Process -FilePath 'Cmd.exe' -ArgumentList "/C Reg.exe UNLOAD HKU\$($UserProfile.SID)" -Wait -WindowStyle Hidden
    }
}
