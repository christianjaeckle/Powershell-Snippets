Install-WinGetPackage -Id 'Git.Git' -Scope Any -Architecture X64 -Mode Silent

# Install with custom configuration
#Install-WinGetPackage -Id 'Git.Git' -Scope Any -Architecture X64 -Mode Silent -Custom "/LoadInf=""$Script_FolderPath\Configurations\Git.cfg"""
