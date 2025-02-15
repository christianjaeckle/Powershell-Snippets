[string]$SQLScript_FilePath = (Join-Path -Path $env:UserProfile -ChildPath "Desktop\SQL_Script.sql")

Invoke-Sqlcmd -ServerInstance $env:ComputerName -Database 'tempdb' -AbortOnError -InputFile $SQLScript_FilePath
