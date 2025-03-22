# Size of current users profile
Get-ChildItem -Path $env:UserProfile -Recurse | Measure-Object -Property Length -Sum -Maximum
