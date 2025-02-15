$Token = Read-Host -Prompt 'Please enter / paste your TeamViewer API token' -AsSecureString

Connect-TeamViewerApi -ApiToken $Token
