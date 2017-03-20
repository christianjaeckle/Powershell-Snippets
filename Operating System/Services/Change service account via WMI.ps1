
#Requires -RunAsAdministrator

# Define variables
$Computer = "."
$ServiceName = "DevQueryBroker"
$ServiceUser = "brandmaker\christian.jaeckle"
$ServicePassword = "31JC_BMExit"

# Get service object
$wmiService = Get-WmiObject -ComputerName $Computer -Query "SELECT * FROM Win32_Service WHERE Name = '$ServiceName'"

# Stop service
Stop-Service -Name $ServiceName

# Set service attribute
$wmiService.Change($null, $null, $null, $null, $null, $null, "$ServiceUser",$ServicePassword)
