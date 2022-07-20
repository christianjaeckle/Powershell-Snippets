# Printer
Get-Printer -Name "Microsoft Print to PDF" | Select Name, PortName, DriverName, JobCount, Shared

# Driver
Get-Printer -name *| %{Get-PrinterDriver -Name $_.DriverName | Select Name, MajorVersion}

# Port
Get-Printer -name "Microsoft Print to PDF" | %{ Get-PrinterPort -Name $_.PortName | Select Name, PrinterHostAddress, PortNumber }
