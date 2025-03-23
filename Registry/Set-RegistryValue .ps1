#Requires -Version 3

Set-StrictMode -Version Latest

function Set-RegistryValue {
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
            Mandatory = $false,
            ValueFromPipeline = $true)]
        [string]$Name,
        
        [Parameter(
            Position = 2,
            Mandatory = $false,
            ValueFromPipeline = $true)]
        $Value,

        [Parameter(
            Position = 3,
            Mandatory = $false,
            ValueFromPipeline = $true)]
        [ValidateSet('String', 'ExpandString', 'Binary', 'DWord', 'MultiString', 'QWord')]
        [string]$Type
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
            } default {
                $Key = $Path
            }
        }
    }

    process {
        if ($PSCmdlet.ShouldProcess($Key , 'Add / Set registry value')) {
            # Create registry key
            if (-not (Test-Path -PathType Container -Path $Key)) {
                New-Item -Path $Key -ErrorAction Stop -Confirm:$false -Force -WhatIf:$WhatIfPreference | Out-Null
            }

            if (($Name -eq $null) -or ($Name -eq '')) {
                # Set key default value
                Set-Item -Path $Key -Value $Value -ErrorAction Stop -Confirm:$false -Force -WhatIf:$WhatIfPreference | Out-Null
            }
            else {
                if ((Get-ItemProperty -Path $Key -Name $Name -ErrorAction SilentlyContinue)) {
                    # Modify existing value
                    Set-ItemProperty -Path $Key -Name $Name -Value $Value -ErrorAction Stop -Confirm:$false -Force -WhatIf:$WhatIfPreference | Out-Null
                }
                else {
                    # Create new value
                    New-ItemProperty -Path $Key -Name $Name -Value $Value -PropertyType $Type -ErrorAction Stop -Confirm:$false -Force -WhatIf:$WhatIfPreference | Out-Null
                }
            }
        }
    }
}

#Set-RegistryValue -Path 'HKEY_CURRENT_USER\Test' -Name 'Test1' -Value '2'
