#Requires -Version 3

Set-StrictMode -Version Latest

function Remove-EmptyFolders {
    [CmdletBinding(SupportsShouldProcess = $True)]

    param(
        [Parameter(
            Position = 0,
            Mandatory = $true,
            ValueFromPipeline = $true)]
        [ValidateScript({ Test-Path -PathType Container -Path $_ })]
        [string]$Path
    )

    begin {
        [int32]$Script:Counter = 0

        if (++$Counter -eq 1) {
            $RootPath = $Path
        }

        # Avoid type overflow
        if ($Counter -eq [int32]::MaxValue) {
            $Counter = 1
        }
    }

    process {
        foreach ($Directory IN (Get-ChildItem -LiteralPath $Path -Directory)) {
            if ($PSCmdlet.ShouldProcess($Directory.FullName , 'Delete directory')) {
                Remove-EmptyFolders -Path $Directory.FullName -ErrorAction SilentlyContinue -Force -WhatIf:$WhatIfPreference
            }
        }

        $Children = Get-ChildItem -LiteralPath $Path -Force

        if ($null -eq $Children) {
            if ($RootPath -ne $Path) {
                if ($PSCmdlet.ShouldProcess($Directory.FullName , 'Delete directory')) {
                    Remove-Item -LiteralPath $Path -Force -ErrorAction SilentlyContinue -WhatIf:$WhatIfPreference
                }
            }
        }
    }
}
