Winget install --id Microsoft.PowerShell --architecture x64 --scope machine --silent

# With custom configuration
Winget install --id Microsoft.PowerShell --architecture x64 --scope machine --silent --custom "Use_MU=1 Enable_MU=1 ADD_EXPLORER_CONTEXT_MENU_OPENPOWERSHELL=0 ADD_FILE_CONTEXT_MENU_RUNPOWERSHELL=0 ENABLE_PSREMOTING=1 ADD_PATH=1 DISABLE_TELEMETRY=1"
