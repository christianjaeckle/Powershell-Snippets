# Enable optional feature Windows Sandbox
Enable-WindowsOptionalFeature -FeatureName 'Containers-DisposableClientVM' -Online -All -NoRestart

# A restart of the computer is needed after the installation
