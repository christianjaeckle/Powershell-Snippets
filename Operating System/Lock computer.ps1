Function Lock-Computer {
    <#
.DESCRIPTION
    Lock the computer
.SYNOPSIS
    Lock the computer using the win32 user32.dll library.
.EXAMPLE
    Lock-Computer
#>

    $signature = @"
[DllImport("user32.dll", SetLastError = true)]
public static extern bool LockWorkStation();
"@

    $LockComputer = Add-Type -memberDefinition $signature -name 'Win32LockWorkStation' -namespace Win32Functions -passthru
    $LockComputer::LockWorkStation() | Out-Null
}
