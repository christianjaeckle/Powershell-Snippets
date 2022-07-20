If ( (Get-NetAdapter -Name 'Ethernet').Status -ne 'Connected' ) {
	Get-NetAdapter | Disable-NetAdapter -Confirm:$false -AsJob | Wait-Job
	
	Enable-NetAdapter -Name 'Wi-Fi'-Confirm:$false
}
