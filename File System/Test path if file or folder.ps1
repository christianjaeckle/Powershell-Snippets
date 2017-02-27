$TestPath = "$env:windir"

# Exists the path?
Test-Path -Path $TestPath

# Is it a file?
Test-Path -Path $TestPath -PathType Leaf

# Is it a folder / directory?
Test-Path -Path $TestPath -PathType Container
