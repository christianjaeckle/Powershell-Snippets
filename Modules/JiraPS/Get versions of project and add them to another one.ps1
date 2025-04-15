# Authentication, if needed
if (-not ($AJ_Cred)) {
    $AJ_Cred = Get-Credential -Message "Please enter your Jira credentials" -UserName ${env:username}
}

# Get versions of source project for current year
$DateFilter = Get-Date -Year (Get-Date -UFormat %Y) -Month 1 -Day 1
$AJ_ProjVersions = Get-JiraVersion -Credential $AJ_Cred -Project "SOURCEPROJECT" -Sort releaseDate | Where-Object { $_.Released -eq "True" -and $_.Name -notlike "ServiceXYZ*" -and $_.ReleaseDate -ge $DateFilter } | Select-Object Name, Description, ReleaseDate

# Create missing versions to target project
[regex]$Pattern = "^(?<r_name>.{2,})\s\(v(?<r_version>\d{1,3}.\d{1,3}.\d{1,3}.\d{1,3})\)"

$AJ_ProjVersions | ForEach-Object {
    if ($_.Name -match $Pattern) {
        $Ver_Name = $Matches.r_name
        $Ver_Version = $Matches.r_version
    }
    else {
        $Ver_Name = $_.Name
    }

    New-JiraVersion -Credential $AJ_Cred -Name $AJ_ProjVersions.Name -Description $AJ_ProjVersions.Description -Released $AJ_ProjVersions.Released -ReleaseDate $AJ_ProjVersions.ReleaseDate
}
