# Waits until Notepad gets closed or 5 seconds
Wait-Process -Name Notepad -Timeout 5 -ErrorAction SilentlyContinue
