# Defaine variables
[double]$Fahrenheit = Read-Host -Prompt "Input a number in Fahrenheit (example: 80)"
[double]$Celsius = 0

# Calculate
$Celsius = [math]::Round(($Fahrenheit - 32) / 1.8, 2)

# Round and show result
Write-Output $Celsius
