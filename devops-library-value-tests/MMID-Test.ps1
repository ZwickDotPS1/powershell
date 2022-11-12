$MMID = "$env:MMID"
$MofuMobiDB = "$env:MOFUMOBIDB"

# function connects to the MofuMobi DB and verifies the ID is correct. 

###### This must be run on an agent inside our network! Will fail otherwise, db not exposed.

Install-module PSSQLite -force
Import-Module PSSQLite -force

$ServerLike = "%$MofuMobiDB%"
$ServerQuotes = '"'+$ServerLike+'"'

$Database = "\\mmapp\C$\Program Files\iisnode\www\connection-manager\database.sqlite"
$IDQuery = "Select companyId From connections where Database like $ServerQuotes Order by CompanyID Desc"
$QueryOut = Invoke-SqliteQuery -Query $IDQuery -DataSource $Database
$IDValue = $QueryOut.'CompanyId'

if ($IDValue = $MMID) { 
    write-output "MMID check PASSED" 
    } else { write-error "FAILED - MMID check" }