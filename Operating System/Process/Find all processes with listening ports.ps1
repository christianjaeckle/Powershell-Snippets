Get-Process -Id (Get-NetTCPConnection -State Listen).OwningProcess | Select-Object Id, ProcessName, StartTime, Company, Product, Path, TotalProcessorTime, VirtualMemorySize
