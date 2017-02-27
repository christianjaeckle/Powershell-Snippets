# Create MediaPlayer object
$MPlayer = New-Object System.Media.SoundPlayer

# Define path to wav file
$MPlayer.SoundLocation = "$env:windir\Media\notify.wav"

# Play
$MPlayer.Play()
