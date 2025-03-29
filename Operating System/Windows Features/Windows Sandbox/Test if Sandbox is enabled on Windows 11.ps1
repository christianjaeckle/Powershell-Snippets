if (Get-WindowsOptionalFeature -FeatureName 'Containers-DisposableClientVM' -Online | Where-Object State -EQ 'Enabled') {
    Write-Output 'Windows Sandbox is installed.'
} else {
    Write-Output 'Windows Sandbox is NOT installed!'
}
