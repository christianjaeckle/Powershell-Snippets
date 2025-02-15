# Measures
Get-ChildItem -Path "C:\Program Files\TeamViewer\TeamViewer_Resource*.dll" | Measure-Object -Property Length -Min -Max -Average -Sum

# List
Get-ChildItem -Path "C:\Program Files\TeamViewer\TeamViewer_Resource*.dll" | Select-Object Name, Length | Sort-Object -Property Name
