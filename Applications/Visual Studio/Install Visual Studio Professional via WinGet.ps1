Install-WinGetPackage -Id 'Microsoft.VisualStudio.2022.Professional' -Scope Any -Architecture X64 -Mode Silent

# Install with custom configuration
#Install-WinGetPackage -Id 'Microsoft.VisualStudio.2022.Professional' -Scope Any -Architecture X64 -Mode Silent -Override "--passive --config "D:\VisualStudio.vsconfig"
