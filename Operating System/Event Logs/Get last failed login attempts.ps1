#Requires -Version 3.0 -RunAsAdministrator

<#
.SYNOPSIS
    Returns recent failed login attempts of all users.

.DESCRIPTION
    Returns recent failed login attempts of all users.

.EXAMPLE

#>

function Resolve-UserLogonType {
    Param($LogonType)
    switch ($LogonType) {
        '0' {
            'Interactive'; break 
        }
        '2' {
            'Interactive'; break 
        }
        '3' {
            'Network'; break 
        }
        '4' {
            'Batch'; break 
        }
        '5' {
            'Service'; break 
        }
        '6' {
            'Proxy'; break 
        }
        '7' {
            'Unlock'; break 
        }
        '8' {
            'Networkcleartext'; break 
        }
        '9' {
            'NewCredentials'; break 
        }
        '10' {
            'RemoteInteractive'; break 
        }
        '11' {
            'CachedInteractive'; break 
        }
        '12' {
            'CachedRemoteInteractive'; break 
        }
        '13' {
            'CachedUnlock'; break 
        }
        Default {
        }
    }
}

function Resolve-UserLogonFailureReason {
    Param($FailureReason)

    switch ($FailureReason) {
        '0xC0000064' {
            'Account does not exist'; break 
        }
        '0xC000006A' {
            'Incorrect password'; break 
        }
        '0xC000006D' {
            'Incorrect username or password'; break 
        }
        '0xC000006E' {
            'Account restriction'; break 
        }
        '0xC000006F' {
            'Invalid logon hours'; break 
        }
        '0xC000015B' {
            'Logon type not granted'; break 
        }
        '0xc0000070' {
            'Invalid Workstation'; break 
        }
        '0xC0000071' {
            'Password expired'; break 
        }
        '0xC0000072' {
            'Account disabled'; break 
        }
        '0xC0000133' {
            'Time difference at DC'; break 
        }
        '0xC0000193' {
            'Account expired'; break 
        }
        '0xC0000224' {
            'Password must change'; break 
        }
        '0xC0000234' {
            'Account locked out'; break 
        }
        '0x0' {
            '0x0'; break 
        }
        default {
            'Other'; break 
        }
    }
}

Get-EventLog -LogName Security -InstanceId 4625 | Sort-Object TimeGenerated | ForEach-Object {
    $_ | Select-Object -Property @(
        @{Label = 'TimeGenerated'; Expression = { $_.TimeGenerated } },
        @{Label = 'Category'; Expression = { $_.CategoryNumber } },
        @{Label = 'Username'; Expression = { $_.ReplacementStrings[5] } },
        @{Label = 'Workstation'; Expression = { $_.ReplacementStrings[13] } },
        @{Label = 'SourceIP'; Expression = { $_.ReplacementStrings[19] } },
        @{Label = 'LogonType'; Expression = { $_.ReplacementStrings[8] } },
        @{Label = 'FailureStatus'; Expression = { Resolve-UserLogonFailureReason($_.ReplacementStrings[7]) } },
        @{Label = 'FailureSubStatus'; Expression = { Resolve-UserLogonFailureReason($_.ReplacementStrings[9]) } }
    )
}
