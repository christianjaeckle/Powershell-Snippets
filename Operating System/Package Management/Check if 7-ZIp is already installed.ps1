# Check if the application 7-Zip is already installed on the computer
Get-Package -ProviderName Programs,msi -Name "7-Zip*"
