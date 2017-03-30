$StatusCode = 3

Switch ($StatusCode) {
	0 { $StatusText = "Ok" }
	1 { $StatusText = "Warn" }
	2 { $StatusText = "Error" }
	3 { $StatusText = "Block" }
	default { $StatusText = "Unknown" }
}

# OR (Shorter)

$StatusText = Switch ($StatusCode) {
	0 { "Ok" }
	1 { "Warn" }
	2 { "Error" }
	3 { "Block" }
	default { "Unknown" }
}
