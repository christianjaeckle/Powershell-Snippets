# https://technet.microsoft.com/en-us/library/bb613488(v=vs.85).aspx
# https://stackoverflow.com/questions/2436510/powershell-profile-on-exit-event

Start-Transcript -Path "$env:userprofile\desktop\Powershell - Session Log.txt" -Append

# Do something

Stop-Transcript
