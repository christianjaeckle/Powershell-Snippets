quser.exe | Select-Object -Skip 1 | ForEach-Object {
    $id = ($_ -split ' +')[-5]
    
    Write-Host $id
    
    #logoff $id
}
