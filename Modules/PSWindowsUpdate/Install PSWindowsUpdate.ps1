#Requires -RunAsAdministrator

# Add provider for packages
Install-PackageProvider -Name PSWindowsUpdate -Force

# Install new module
Install-Module -Name PSWindowsUpdate -Repository PSGallery -Force
