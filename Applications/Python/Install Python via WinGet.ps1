Install-WinGetPackage -Id 'Python.Python.3.11' -Scope Any -Architecture X64 -Mode Silent

# With custom configuration
#Install-WinGetPackage -Id 'Python.Python.3.11' -Scope Any -Architecture X64 -Mode Silent -Custom '/quiet InstallAllUsers=1 AssociateFiles=1 CompileAll=1 AppendPath=1 Include_doc=0 Include_tcltk=0 Include_test=0'
