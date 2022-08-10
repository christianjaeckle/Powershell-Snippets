# Open Filter Security Event Log and to track user logon session, set filter Security Event Log for the following Event ID’s:

function Get-LogonHistory {
    Param (
        [int]$Days = 7
    )

    $Result = @()
    $ELogs = Get-EventLog System -Source Microsoft-Windows-WinLogon -After (Get-Date).AddDays(-$Days)

    if ($ELogs) {
        foreach ($Log in $ELogs) {
            # Logon – 4624 (An account was successfully logged on) 
            # Logoff – 4647 (User initiated logoff) 
            # Startup – 6005 (The Event log service was started) 
            # RDP Session Reconnect – 4778 (A session was reconnected to a Window Station) 
            # RDP Session Disconnect – 4779 (A session was disconnected from a Window Station) 
            # Locked – 4800 (The workstation was locked) 
            # Unlocked – 4801 (The workstation was unlocked)

            if ($Log.InstanceId -eq 4624) {
                $ET = 'Logon'
            }
            elseif ($Log.InstanceId -eq 7002) {
                $ET = 'Logoff'
            }
            elseif ($Log.InstanceId -eq 4800) {
                $ET = 'Locked'
            }
            elseif ($Log.InstanceId -eq 4801) {
                $ET = 'Unlocked'
            }
            else {
                Continue
            }
            
            $Result += New-Object PSObject -Property @{
                Time         = $Log.TimeWritten.ToString('yyyy-MM-dd HH:mm')
                'Event Type' = $ET
                User         = (New-Object System.Security.Principal.SecurityIdentifier $Log.ReplacementStrings[1]).Translate([System.Security.Principal.NTAccount])
            }
        }
        
        $Result | Select-Object Time, 'Event Type', User | Sort-Object Time -Descending | Format-Table
    }
}

Get-LogonHistory -Days 3
