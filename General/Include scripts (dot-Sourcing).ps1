# Load common functions
Try {
    . "$PSScriptRoot\CommonScripts.ps1"
}
Catch {
    Write-Error -Message "Failed to import common functions (CommonScripts.ps1), which are needed."
}
