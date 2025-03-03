$Property = Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Microsoft SQL Server\Instance Names\SQL'
$Instance = $Property.PSObject.Properties | Where-Object { $_.Value -Like 'MSSQL*' }
$Instance.Value
