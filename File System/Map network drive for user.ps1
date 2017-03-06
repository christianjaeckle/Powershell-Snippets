# Creates a new network drive with drive letter "X"
# Links to UNC path \\Server\Share

New-PSDrive -Name X -PSProvider FileSystem -Root "\\Server\Share" -Persist
