# Install the Windows Sandbox
Enable-WindowsOptionalFeature -FeatureName 'Containers-DisposableClientVM' -All -Online -NoRestart

# A restart of the computer is needed after the installation
