if (Get-WindowsOptionalFeature -FeatureName 'HypervisorPlatform' -Online | Where-Object State -EQ 'Enabled') {
    Write-Output 'Hyper-V is installed.'
} else {
    Write-Output 'Hyper-V is NOT installed!'
}
