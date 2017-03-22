Get-Command | Where-Object {$_.parameters.keys -contains "ComputerName"}
