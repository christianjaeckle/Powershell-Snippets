# Enable optional feature Hyper-V
Enable-WindowsOptionalFeature -FeatureName 'HypervisorPlatform' -Online -NoRestart

# A restart of the computer is needed after the installation
