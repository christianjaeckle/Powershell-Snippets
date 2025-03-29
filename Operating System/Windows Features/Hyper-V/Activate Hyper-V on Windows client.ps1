# Enable optional feature Hyper-V
Enable-WindowsOptionalFeature -FeatureName 'Microsoft-Hyper-V' -Online -All -NoRestart

# A restart of the computer is needed after the installation
