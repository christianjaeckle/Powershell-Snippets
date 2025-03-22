# Get size of all local user profiles on device
Get-ChildItem -Path (Join-Path -Path $env:SystemDrive -ChildPath 'Users') | ForEach-Object {
	[PSCustomObject]@{
		Name   = $_.BaseName
		Length = Get-ChildItem -Path $_.FullName -Recurse -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum -ErrorAction SilentlyContinue | Select-Object -Property Sum -ExpandProperty Sum
	}
}
