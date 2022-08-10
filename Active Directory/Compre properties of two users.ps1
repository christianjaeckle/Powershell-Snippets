Function Compare-ObjectProperties {
    Param(
        [PSObject]$ReferenceObject,
        [PSObject]$DifferenceObject 
    )
    $objprops = $ReferenceObject | Get-Member -MemberType Property, NoteProperty | ForEach-Object Name
    $objprops += $DifferenceObject | Get-Member -MemberType Property, NoteProperty | ForEach-Object Name
    $objprops = $objprops | Sort-Object | Select-Object -Unique
    $diffs = @()
    foreach ($objprop in $objprops) {
        $diff = Compare-Object -ReferenceObject $ReferenceObject -DifferenceObject $DifferenceObject -Property $objprop
        if ($diff) {            
            $diffprops = @{
                PropertyName = $objprop
                RefValue     = ($diff | Where-Object { $_.SideIndicator -eq '<=' } | ForEach-Object $($objprop))
                DiffValue    = ($diff | Where-Object { $_.SideIndicator -eq '=>' } | ForEach-Object $($objprop))
            }
            $diffs += New-Object PSObject -Property $diffprops
        }        
    }
    if ($diffs) { return ($diffs | Select-Object PropertyName, RefValue, DiffValue) }     
}
 
$ad1 = Get-ADUser User1 -Properties *
$ad2 = Get-ADUser User2 -Properties *

Compare-ObjectProperties $ad1 $ad2 | Out-GridView
