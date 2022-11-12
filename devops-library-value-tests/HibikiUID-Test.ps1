$APIPassword = "$env:APIPASSWORD"
$HibikiDB = "$env:HIBIKIDB"
$SQLPassword = "$env:SQLPassword"
$SQLServer = "$env:SQLSERVER"
$SQLUser = "$env:SQLUser"
$HIBIKIUID = "$env:HIBIKIUID"

# This block tests connects to the Hibiki DB and checks their ID string and their password. 
# If not set up or older version of SBI, it will error out. 

function hibikiUIDTest {
    $QueryString = "SELECT TOP 1 clientId FROM "+$HibikiDB+".dbo.config"
    $HibikiEval = Invoke-Sqlcmd -Query $QueryString -ServerInstance $SQLServer -Username $SQLUser -Password $SQLPassword
    if ($HibikiEval = $HIBIKIUID) {
        write-warning 'hibikiUIDTest: PASSED'
    } else {
        write-output 'hibikiUIDTest: FAILED - HibikiUID does not match data in $HibikiDB.dbo.config, or Hibiki has not been set up yet'
    }
}

function hibikiPasswordTest {
    $QueryString = "SELECT TOP 1 apiPassword FROM "+$HibikiDB+".dbo.config"
    $HibikiEval = Invoke-Sqlcmd -Query $QueryString -ServerInstance $SQLServer -Username $SQLUser -Password $SQLPassword
    if ($HibikiEval = $APIPassword) {
        write-output 'hibikiPasswordTest: PASSED'
    } else {
        write-output 'hibikiPasswordTest: FAILED - HibikiPassword does not match data in $HibikiDB.dbo.config, or Hibiki has not been set up yet'
    }
}

hibikiUIDTest
hibikiPasswordTest