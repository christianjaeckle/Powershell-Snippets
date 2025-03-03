$Port = 5985

Get-Process -Id (Get-NetUDPEndpoint -LocalPort $Port).OwningProcess
