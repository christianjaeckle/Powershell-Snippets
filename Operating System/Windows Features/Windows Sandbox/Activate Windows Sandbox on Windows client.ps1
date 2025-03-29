# Enable optional feature Windows Sandbox
Enable-WindowsOptionalFeature -FeatureName 'Containers-DisposableClientVM' -Online -NoRestart

# A restart of the computer is needed after the installation
