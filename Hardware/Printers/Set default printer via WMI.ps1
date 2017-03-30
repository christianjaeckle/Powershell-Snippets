$PrinterName = "Microsoft Print to PDF"

(Get-WmiObject -ComputerName . -Class Win32_Printer -Filter "Name=$PrinterName").SetDefaultPrinter()
