function Get-WindowsServerEdition($ComputerName) {

   $OS_Info = Get-CimInstance Win32_OperatingSystem -ComputerName $ComputerName
   $OS_Info.Caption

   switch ($OS_Info.OperatingSystemSKU) {
      7 { 'Windows Server Standard Edition (Desktop Experience)' }
      8 { 'Windows Server Datacenter Edition (Desktop Experience)' }
      12 { 'Datacenter Server Core' }
      13 { 'Standard Server Core' }
      50 { 'Windows Server Essentials (Desktop Experience)' }
      143 { 'Windows Server Datacenter Edition (Nano Server)' }
      144 { 'Windows Server Standard Edition (Nano Server)' }
      default { 'Unbekannte Edition' }
   }
}

Get-WindowsServerEdition -ComputerName localhost
