# Execute powercfg
Start-Process -FilePath "$env:windir\System32\powercfg.exe" -ArgumentList "/h off"
