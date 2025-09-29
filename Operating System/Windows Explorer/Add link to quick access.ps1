$Path = (Join-Path -Path $env:UserProfile -ChildPath 'AppData')

(New-Object -ComObject Shell.Application).Namespace($Path).Self.InvokeVerb('PinToHome')
