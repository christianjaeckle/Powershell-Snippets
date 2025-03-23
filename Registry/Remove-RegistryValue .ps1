#Requires -Version 3

Set-StrictMode -Version Latest

function Remove-RegistryValue {
    [CmdletBinding(SupportsShouldProcess)]

    param
    (
        [Parameter(
            Position = 0,
            Mandatory = $true,
            ValueFromPipeline = $true)]
        [string]$Path,

        [Parameter(
            Position = 1,
            Mandatory = $true,
            ValueFromPipeline = $true)]
        [string]$Name
    )

    begin {
        # Adapt registry path format
        [string]$Key = $null

        switch -Regex ($Path) {
            '^HKEY_CLASSES_ROOT\\' {
                $Key = $Path -Replace '^HKEY_CLASSES_ROOT\\', 'HKCR:\'
                Break
            }
            '^HKEY_LOCAL_MACHINE\\' {
                $Key = $Path -Replace '^HKEY_LOCAL_MACHINE\\', 'HKLM:\'
                Break
            }
            '^HKEY_USERS\\' {
                $Key = $Path -Replace '^HKEY_USERS\\', 'HKU:\\'
                Break
            }
            '^HKEY_CURRENT_USER\\' {
                $Key = $Path -Replace '^HKEY_CURRENT_USER\\', 'HKCU:\'
                Break
            }
            '^HKEY_CURRENT_CONFIG\\' {
                $Key = $Path -Replace '^HKEY_CURRENT_CONFIG\\', 'HKCC:\'
                Break            
            }
        }
    }

    process {
        if ($PSCmdlet.ShouldProcess("$Key\$Name" , 'Delete registry value')) {
            Remove-ItemProperty -Path $Key -Name $Name -ErrorAction Continue -WhatIf:$WhatIfPreference
        }
    }
}

#Remove-RegistryValue -Path 'HKEY_CURRENT_USER\Test' -Name '=Test1' -WhatIf
