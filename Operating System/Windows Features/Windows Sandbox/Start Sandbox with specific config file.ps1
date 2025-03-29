$Config_FilePath = (Join-Path -Path $PSScriptRoot -ChildPath 'Sandbox_Config.wsb')
Start-Process (Join-Path $env:WinDir -ChildPath 'system32\WindowsSandbox.exe') -ArgumentList "$Config_FilePath"
