#Requires -RunAsAdministrator

# Add provider for packages
Install-PackageProvider -Name NuGet -Force

# Install new module
Install-Module ConfluencePS -Repository PSGallery -Force
