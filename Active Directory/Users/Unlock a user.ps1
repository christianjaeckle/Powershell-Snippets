Unlock-ADAccount -Identity USERNAME

# OR

'USERNAME' | %{ Enable-ADAccount $_ }
