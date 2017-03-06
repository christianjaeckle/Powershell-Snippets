$ServiceName = "HomeGroupProvider"

# Starting service
Start-Service -Name $ServiceName

# Stopping service
Stop-Service -Name $ServiceName
