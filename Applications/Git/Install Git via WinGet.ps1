Install-WinGetPackage -Id 'Git.Git' -Scope Any -Architecture X64 -Mode Silent

# With custom file
#Install-WinGetPackage -Id 'Git.Git' -Scope Any -Architecture X64 -Mode Silent -Custom "/LoadInf=""$Script_FolderPath\Configurations\Git.cfg"""
