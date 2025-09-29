$Name = 'Bilder'

((New-Object -ComObject Shell.Application).Namespace('Shell:::{679f85cb-0220-4080-b29b-5540cc05aab6}').Items() | Where-Object { $_.Name -eq $Name }).InvokeVerb('UnpinFromHome')
