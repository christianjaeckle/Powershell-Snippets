$ServiceResult = New-WebServiceProxy -Uri "http://www.webservicex.net/uszip.asmx?WSDL"
$ServiceResult.GetInfoByCity("New York").Table
$ServiceResult.GetInfoByZIP("10286").Table
