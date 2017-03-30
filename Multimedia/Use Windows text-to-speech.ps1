$Speech = New-Object -ComObject "sapi.spvoice"
$Speech.Voice = $Speech.GetVoices().item(0)
$Speech.Rate = 0
$Speech.Speak("Hello World!")
