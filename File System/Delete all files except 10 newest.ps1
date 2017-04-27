$arrDateien = Get-ChildItem *.* | ? {! $_.PSIsContainer } | Sort-Object LastWriteTime
Remove-Item $arrDateien [0..($arrDateien.count - 11)]

# OR

Get-ChildItem *.* | ? {! $_.psiscontainer} | Sort-Object LastWriteTime -desc | Select-Object -skip(10) | Remove-Item
