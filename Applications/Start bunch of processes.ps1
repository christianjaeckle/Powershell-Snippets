# Start 5 instances of Notepad
1..5 | Foreach { Start-Process Notepad }

# Count number of processes
(Get-Process Notepad).Count
