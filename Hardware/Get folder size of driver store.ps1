# Gets the size of the driver store in GB.
(Get-ChildItem -Path (Join-Path -Path $env:WinDir -ChildPath 'System32\DriverStore\FileRepository') -Recurse | Measure-Object -Property Length -Sum).Sum /1GB
