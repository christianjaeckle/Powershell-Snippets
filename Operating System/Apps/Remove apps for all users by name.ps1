$AppsToRemove = @(
    'Microsoft.3DBuilder',
    'Microsoft.Appconnector',
    'Microsoft.BingFinance',
    'Microsoft.BingNews',
    'Microsoft.CommsPhone',
    'Microsoft.ConnectivityStore',
    'Microsoft.DesktopAppInstaller',
    'Microsoft.Getstarted',
    'Microsoft.Messaging',
    'Microsoft.MicrosoftOfficeHub',
    'Microsoft.MicrosoftStickyNotes',
    'Microsoft.Office.OneNote',
    'Microsoft.Office.Sway',
    'Microsoft.OneConnect',
    'Microsoft.People',
    'Microsoft.SkypeApp',
    'Microsoft.StorePurchaseApp',
    'Microsoft.WindowsAlarms',
    'Microsoft.WindowsCamera',
    'microsoft.windowscommunicationsapps',
    'Microsoft.WindowsPhone',
    'Microsoft.WindowsSoundRecorder'
)

foreach ($AppsToRemove in $ProvisionedAppPackageNames) {
    Get-AppxPackage -Name $AppsToRemove -AllUsers | Remove-AppxPackage

    Get-AppXProvisionedPackage -Online | Where-Object DisplayName -eq $AppsToRemove | Remove-AppxProvisionedPackage -Online
}
