$RootPath = "X:\Test folder"

Get-ChildItem $RootPath -Directory -Recurse | ForEach-Object {
    If ((Get-ChildItem $_.FullName) -eq $null) {
        Remove-Item -Path $_.FullName -Confirm:$false -Verbose -WhatIf
    }
}
