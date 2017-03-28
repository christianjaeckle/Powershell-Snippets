try {
    ([WMICLASS]"root\default:SystemRestore").Disable("*") | Out-Null
    
    # Disable via registry
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore" -Name "DisableSR" -Value "1" -Type DWORD | Out-Null
    
    # Disable scheduled task
    Disable-ScheduledTask -TaskName "SR" -TaskPath "\Microsoft\Windows\SystemRestore\" | Out-Null
} catch {
    Write-Warning -Message "Failed to turn off."
}
