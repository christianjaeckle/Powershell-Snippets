# Downloads 7-Zip (64-bit) package to downloads folder
Export-WinGetPackage -DownloadDirectory (Join-Path -Path $env:UserProfile -ChildPath 'Downloads') -Architecture X64 -InstallerType Exe -Scope System -Name '7-Zip' -SkipDependencies
