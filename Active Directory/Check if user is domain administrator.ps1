If(([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole("Domänen Admins"))
{
  Write-Host "User running this script has the domain admins rights."
}
Else
{
  Write-Host "User running this script has NO domain admins rights."
}
