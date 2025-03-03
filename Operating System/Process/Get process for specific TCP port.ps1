$Port = 5985

Get-Process -Id (Get-NetTCPConnection -LocalPort $Port).OwningProcess
