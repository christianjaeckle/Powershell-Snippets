Get-Process | Where-Object { $_.MainWindowTitle } | Select-Object ProcessName, MainWindowTitle
