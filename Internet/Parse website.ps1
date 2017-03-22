$Content = Invoke-WebRequest -Uri www.google.de

# Links
$Content.links

# Urls
$Content.links | select innerText,href

# Forms
$Content.forms.fields
