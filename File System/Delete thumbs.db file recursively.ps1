Get-ChildItem -Path . -Include "Thumbs.db" -Recurse -Force | Remove-Item -Force -WhatIf
