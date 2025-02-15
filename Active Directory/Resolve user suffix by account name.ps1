function Get-ActiveDirectoryAccount {
    param([Parameter(Mandatory = $true)][string] $AccountName)
    $searcher = New-Object System.DirectoryServices.DirectorySearcher
    $searcher.Filter = "(&(objectClass=user)(sAMAccountName:=$AccountName))"
    $searcher.PropertiesToLoad.AddRange(@("SAMAccountName", "name"))
    $searcher.FindAll() | Select-Object -ExpandProperty "Properties" | Format-Table
}

Get-ActiveDirectoryAccount -AccountName $env:USERNAME

# OR
Get-ActiveDirectoryAccount -AccountName "ABCDEFG"
