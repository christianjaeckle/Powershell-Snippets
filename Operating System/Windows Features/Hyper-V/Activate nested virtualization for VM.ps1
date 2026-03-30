# If you want to install a VM with virtualization enabled (e.g., the Hyper-V role) on a Hyper-V host, you must enable the “Nested Virtualization” feature for that VM.

Get-VM -Name 'YourVM' | Set-VMProcessor -ExposeVirtualizationExtensions $true
Get-VM -Name 'YourVM' | Set-VMNetworkAdapter -MacAddressSpoofing On
