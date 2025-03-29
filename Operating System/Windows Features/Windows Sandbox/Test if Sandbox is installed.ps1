if (Get-WindowsCapability -Online -Name 'Containers-DisposableClientVM' | Where-Object State -EQ 'Installed') {
    Write-Output 'Windows Sandbox is already installed.'
}
else {
    Write-Output 'Windows Sandbox is NOT installed!'
}
