# Enumerate identity and owner
$objIdentity = [System.Security.Principal.WindowsIdentity]::GetCurrent()
$objSecPrinc = New-Object System.Security.Principal.WindowsPrincipal($objIdentity)

# Check for admin rights
if(!$objSecPrinc.IsInRole([System.Security.Principal.WindowsBuiltInRole]::Administrator))
{
	# Enumerate process
  $objProcesses = [System.Diagnostics.Process]::GetCurrentProcess()
	
	# Create new process instance
  $objProcInfos = New-Object System.Diagnostics.ProcessStartInfo $objProcesses.Path
	
	# Get script
  $ThisScript = $MyInvocation.MyCommand.Path
	
	# Get given parameters
  $strParameter = $ThisScript
	
  foreach($strArgument in $args) {
    $strParameter += ' ' + $strArgument
  }
	
	# Overgive parameters to new process
  $objProcInfos.Arguments = $strParameter
	
	# Execute new process
  $objProcInfos.Verb = "runas"
	[System.Diagnostics.Process]::Start($objProcInfos) | Out-Null
	
  return
}

# Already running with admin rights
Write-Host "Script runs as admin. Continue with Return " -NoNewline
