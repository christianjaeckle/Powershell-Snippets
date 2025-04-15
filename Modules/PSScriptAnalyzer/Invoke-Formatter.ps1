$PSPath = 'D:\My PS files'

# Single file
#Invoke-Formatter -ScriptDefinition (Get-Content -Path 'C:\MyFile.ps1' -Raw)

# Multiple files
Get-ChildItem -Path $PSPath -Recurse '*.ps*' | Get-Content -Raw | ForEach-Object { Compare-Object $_ (Invoke-Formatter -Settings PSGallery -ScriptDefinition $_) }

# Different styles
#Invoke-Formatter -Settings CmdletDesign
#Invoke-Formatter -Settings CodeFormatting
#Invoke-Formatter -Settings CodeFormattingAllman
#Invoke-Formatter -Settings CodeFormattingOTBS
#Invoke-Formatter -Settings CodeFormattingStroustrup
#Invoke-Formatter -Settings DSC
#Invoke-Formatter -Settings PSGallery
#Invoke-Formatter -Settings ScriptFunctions
#Invoke-Formatter -Settings ScriptingStyle
#Invoke-Formatter -Settings ScriptingSecurity
