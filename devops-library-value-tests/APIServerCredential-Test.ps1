# This function tries to connect to main SQL server with the API User credentials. It will error if it fails and should work for cloud and on-prem.

$apipassword = "$env:APIPASSWORD"
$apiuser = "$env:APIUSER"
$SQLSERVER = "$env:SQLSERVER"

try {
    write-output "If test passes, it will return the date of the query, and error if not."
    write-output "_"
    $command = Invoke-Sqlcmd -Query "SELECT GETDATE() AS TimeOfQuery" -ServerInstance $SQLSERVER -Username $APIUSER -Password $APIPASSWORD -ErrorAction Stop
    Write-Host "Test passed, APIUSER is correct"
} catch {
    write-Error "Test failed. if Hibiki test passed, problem is with APIUSER variable or Hibiki not yet set up."
}