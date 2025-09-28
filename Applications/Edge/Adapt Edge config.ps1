# PLEASE CREATE A BACKUP OF THE CONFIG FILE BEFORE!

# Variables
$LocalState_FilePath = (Join-Path -Path $Env:LocalAppData -ChildPath 'Microsoft\Edge\User Data\Local State')

# Stop Edge process
Stop-Process -Name 'msedge' -ErrorAction SilentlyContinue

# Read config file content
$LocalState_Content = (Get-Content -Path $LocalState_FilePath -Raw | ConvertFrom-Json)

# Disable side bar
if ($null -eq $LocalState_Content.browser.show_hub_apps_tower) {
    Write-Output 'Sidebar is not set and turned on by default, lets disable it.'

    $LocalState_Content.browser | Add-Member -Name 'show_hub_apps_tower' -Value $false -MemberType NoteProperty
}
else {
    Write-Output "Sidebar is set to: $($LocalState_Content.browser.show_hub_apps_tower) lets make it false."

    $LocalState_Content.browser.show_hub_apps_tower = $false
}

# Disable sharing data between profiles
if ($null -eq $LocalState_Content.local_browser_data_share.enabled) {
    Write-Output 'Disable data share between profiles'

    $blockvalue = @'
    {
        "enabled": false,
        "index_last_cleaned_time": "0"
    }
'@

    $LocalState_Content | Add-Member -Name 'local_browser_data_share' -Value (ConvertFrom-Json $blockvalue) -MemberType NoteProperty
}
else {
    Write-Output 'Disable data share between profiles'

    $LocalState_Content.local_browser_data_share.enabled = $false
}

# Disable enhanced copy paste
if ($null -eq $LocalState_Content.edge_share) {
    Write-Output 'Disable enhanced copy paste'
    $blockvalue = @'
    {
        "enhanced_copy_paste": {
            "default_url_format": 1,
            "enable_secondary_ecp": true
        }
    }
'@

    $LocalState_Content | Add-Member -Name 'edge_share' -Value (ConvertFrom-Json $blockvalue) -MemberType NoteProperty
}
else {
    Write-Output 'Disable enhanced copy paste'

    $LocalState_Content.edge_share.enhanced_copy_paste.default_url_format = 1
}
