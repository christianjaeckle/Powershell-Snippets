Get-ChildItem function:[D-Z]: -n | ?{ !(Test-Path $_) } | Select-Object -First 1
