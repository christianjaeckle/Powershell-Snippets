$TVFiles = Get-ChildItem -Path "${env:ProgramFiles(x86)}\TeamViewer","${env:ProgramFiles}\TeamViewer" -Recurse -Include *.exe,*.dll,*.cat

$TVFiles | Foreach-Object {
    $CheckResult = Get-AuthenticodeSignature -FilePath $_.FullName

    if ($CheckResult.Status -ne "Valid") {
        Write-Host $_.FullName -ForegroundColor Yellow
    }
    else {
        Write-Host $_.FullName -ForegroundColor Green
    }
}
