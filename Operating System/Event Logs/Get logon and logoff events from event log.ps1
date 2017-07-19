function Get-LogonHistory {
    Param (
        [string]$Computer = (Read-Host Computername),
        [int]$Days = 10
    )

    $Result = @()

    Write-Verbose "Checking results..."
    
    $ELogs = Get-EventLog System -Source Microsoft-Windows-WinLogon -After (Get-Date).AddDays(-$Days) -ComputerName $Computer

    if ($ELogs) {
        Write-Verbose "Workup is running..."
        
        foreach ($Log in $ELogs) {
            if ($Log.InstanceId -eq 7001) {
                $ET = "Logon"
            }
            elseif ($Log.InstanceId -eq 7002) {
                $ET = "Logoff"
            }
            else {
                Continue
            }
            
            $Result += New-Object PSObject -Property @{
                Time = $Log.TimeWritten.ToString("yyyy-MM-dd HH:mm")
                "Event Type" = $ET
                User = (New-Object System.Security.Principal.SecurityIdentifier $Log.ReplacementStrings[1]).Translate([System.Security.Principal.NTAccount])
            }
        }
        
        $Result | Select Time, "Event Type", User | Sort Time -Descending | Format-Table
        
        Write-Verbose "Done."
    }
    else {
        Write-Verbose "Problem with $Computer."
		Write-Verbose "Maybe there are no logon/logoff events."
        Write-Verbose "If you see a 'Network path not found' error, try start the Remote Registry service on that computer."
    }
}

Get-LogonHistory -Computer $env:COMPUTERNAME -Days 7
