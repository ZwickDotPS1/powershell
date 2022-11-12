$SQLPassword = "$env:SQLPassword"
$SQLServer = "$env:SQLSERVER"
$SQLUser = "$env:SQLUser"
$TriumphDB = "$env:TRIUMPHDB"

#This test is a work in progress
#it queries the triumph database and gets the customername value from the table in the function, splits the string to an array and checks to see
#if CustomerName contains Word, it's a likely match.
#this won't work for classic-only customers, but should give us a positive result if one of the words in the return string 

$QueryString = "SELECT TOP 1 companyName FROM SBI_Triumph.dbo.configGeneral"
$QueryReturn = Invoke-Sqlcmd -Query $QueryString -ServerInstance $SQLServer -Username $SQLUser -Password $SQLPassword -Database $TriumphDB
$wordarray = $QueryReturn[0].Split(" ")
foreach ($word in $wordarray) {
    $SearchTerm = "*"+$word+"*"
    if($CustomerName -like $SearchTerm) {
        write-output "Possible match for $CustomerName for the word $SearchTerm."
    } else { write-error "$word not found in $($QueryReturn[0])" }
    }