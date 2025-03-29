# Check if Windows Sandbox is already running
if (Get-Process -Name 'WindowsSandbox' -ErrorAction SilentlyContinue) {
    Write-Output "Windows Sandbox is already running."
}
