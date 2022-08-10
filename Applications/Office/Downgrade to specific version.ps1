$ProcessNames = 'access,excel,onenoteim,outlook,powerpnt,winword'
$ProcessNames = $ProcessNames -split (',') -join ('|')

While (Get-Process | Where-Object { $_.ProcessName -match $ProcessNames } -ErrorAction SilentlyContinue | Select-Object Description -ExpandProperty Description | Select-Object -Unique -OutVariable RunningProcesses) {
    $Prompt_Text = 'The following application(s) must be closed:`n' + ($RunningProcesses -join '`n')

    Clear-Host
    Write-Host $Prompt_Text

    Start-Sleep -Seconds 10
}

Set-Location -Path (Join-Path -Path $env:ProgramFiles -ChildPath 'Common Files\microsoft shared\ClickToRun')
Start-Process 'officec2rclient.exe' -ArgumentList '/update user updatetoversion=16.0.12827.20470'
