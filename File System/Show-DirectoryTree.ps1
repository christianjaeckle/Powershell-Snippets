Function Show-DirectoryTree {
	# Function which shows a directory tree of a given folder.
	Param (
		[string]$strStartDir
	)
	
	# Function that indents to a level intI.
	Function Indent {
		Param (
			[Int]$intI
		)
		
		$Global:Indent = $null
		
		For ($x = 1; $x -le $intI; $x++) {
			$Global:Indent += [char]9
		}
	}
	
	$objChildren = get-childitem $strStartDir | sort-object Name
	
	ForEach ($objChild in $objChildren) {
		Indent $intI
		
		“{0}{1}” -f $Indent, $objChild
		
		If ($objChild.PSIsContainer) {
			# Recurse through sub-directory
			$intI ++
			
			Show-DirectoryTree $objChild.PSPath
			
			$intI -–
		}
	}
}

# Start
$intI = 0
Show-DirectoryTree $Env:Temp