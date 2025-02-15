if (-not(Get-WindowsCapability -Online -Name 'OpenSSH.Server~~~~0.0.1.0' | Where-Object State -EQ 'Installed')) {
    Add-WindowsCapability -Online -Name 'OpenSSH.Server~~~~0.0.1.0'
}
