# Define urls to web service
$URI_Lookup = "http://dev.markitondemand.com/MODApis/Api/v2/Lookup/jsonp?input=Microsoft&callback=myFunction"

# Execute request to lookup by stock name
$ResultLookup = Invoke-RestMethod -Method Get -Uri $URI_Lookup

# Clean-up result
$ResultLookup = $ResultLookup.Replace("myFunction(", $null)
$ResultLookup = $ResultLookup.Substring(0, $ResultLookup.Length - 1)

# Convert result from json and show result
$Lookup = ConvertFrom-Json $ResultLookup

$URI_Info = "http://dev.markitondemand.com/MODApis/Api/v2/Quote/jsonp?symbol=" + $Lookup.Symbol.ToString() + "&callback=myFunction"

# Execute request to get stock information
$ResultInfo = Invoke-RestMethod -Method Get -Uri $URI_Info

# Clean-up result
$ResultInfo = $ResultInfo.Replace("myFunction(", $null)
$ResultInfo = $ResultInfo.Substring(0, $ResultInfo.Length - 1)

# Convert result from json and show result
$Info = ConvertFrom-Json $ResultInfo
$Info
