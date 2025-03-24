if($hostinvocation -ne $null) {
    Split-Path $hostinvocation.MyCommand.path
}
else {
    Split-Path $script:MyInvocation.MyCommand.Path
}

# OR
$PSScriptRoot
