# For fixed size disks
Convert-VHD -Path 'X:\Hyper-V\SourceFile.vhd' -DestinationPath 'X:\Hyper-V\TargetFile.vhdx' -VHDType Fixed

# For dynmamic size disks
Convert-VHD -Path 'X:\Hyper-V\SourceFile.vhd' -DestinationPath 'X:\Hyper-V\TargetFile.vhdx' -VHDType Dynamic
