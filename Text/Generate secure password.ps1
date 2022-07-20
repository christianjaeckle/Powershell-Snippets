function New-Password {
	<#
	.SYNOPSIS
		Function to generate a new and complex password.
	
	.DESCRIPTION
		Function to generate a new and complex password.
		
		By default...
		...12 characters length password (parameter Length)
		...exclude following characters: ",',.,/,1,<,>,`,O,0,l,|
		...combine upper and lower case letter, number and special character
	
	.PARAMETER Length
		Specifies the length of the password.
		Default is 12 characters

    .PARAMETER Count
        Specifies how many password should be generated.
        Default is one password.
	
    .EXAMPLE
        New-Password -Length 8
#>
	[CmdletBinding()]
	param(
		[ValidateNotNull()]
		[int]$Length = 12,
		[ValidateRange(1, 256)]
		[Int]$Count = 1
	)
	
	begin {
		# Create script block with the ASCII char codes
		$PasswordCharCodes = { 33..126 }.invoke()
		
		
		# Exclude some ASCII char codes (",',.,/,1,<,>,`,O,0,l,|)
		34, 39, 46, 47, 49, 60, 62, 96, 48, 79, 108, 124 | ForEach-Object { [void]$PasswordCharCodes.Remove($_) }
		$PasswordChars = [char[]]$PasswordCharCodes
	}

	process {
		1..$count | ForEach-Object {
			if ($Length -gt 4) {
			
				do {
					# Generate a Password of the length requested
					$NewPassWord = $(foreach ($i in 1..$length) { Get-Random -InputObject $PassWordChars }) -join ''
				}
				until (
					# Make sure it contains an Upercase and Lowercase letter, a number and another special character
			    ($NewPassword -cmatch '[A-Z]') -and
			    ($NewPassWord -cmatch '[a-z]') -and
			    ($NewPassWord -imatch '[0-9]') -and
			    ($NewPassWord -imatch '[^A-Z0-9]')
				)
			}
			# Password Smaller than 4 characters
			else {
				$NewPassWord = $(foreach ($i in 1..$length) { Get-Random -InputObject $PassWordChars }) -join ''
			}
		
			Return $NewPassword
		}
	}
	end {
		Remove-Variable -Name NewPassWord -ErrorAction 'SilentlyContinue'
	}
}
