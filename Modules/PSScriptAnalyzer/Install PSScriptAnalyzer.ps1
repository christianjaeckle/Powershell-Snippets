#Requires -RunAsAdministrator

# Add provider for packages
Install-PackageProvider -Name NuGet -Force

# Install new module
Install-Module -Name PSScriptAnalyzer -Repository PSGallery -Force
