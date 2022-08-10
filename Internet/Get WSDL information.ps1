$url = 'http://ec.europa.eu/taxation_customs/vies/checkVatService.wsdl'
$webservicex = New-WebServiceProxy -Uri $url -namespace WebServiceProxy -Class checkVat

$webservicex | Get-Member
