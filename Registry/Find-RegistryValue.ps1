#Requires -Version 3

Set-StrictMode -Version Latest

function Find-RegistryValue {
    [CmdletBinding()]

    param
    (
        [Parameter(
            Position = 0,
            Mandatory = $false,
            ValueFromPipeline = $true)]
        [string]$RootKey = 'HKEY_LOCAL_MACHINE',

        [Parameter(
            Position = 1,
            Mandatory = $false,
            ValueFromPipeline = $true)]
        [int]$Depth = 2,

        [Parameter(
            Position = 2,
            Mandatory = $true,
            ValueFromPipeline = $true)]
        [string]$Name
    )

    process {
        Write-Output (Get-ChildItem -Path "Registry::$RootKey" -Recurse -Depth $Depth -ErrorAction SilentlyContinue | Where-Object -Property Property -EQ $Name | Select-Object -Property PSPath)
    }
}

#Find-RegistryValue -Name 'Path64'
