$ServiceName = "HomeGroupProvider"
$ServiceStartup = "Automatic" # Possible values: Automatic, Boot, Disabled, Manual, System

Set-Service -Name $ServiceName -StartupType $ServiceStartup
