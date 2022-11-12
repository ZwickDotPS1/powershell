$apipassword = "$env:APIPASSWORD"
$apiuser = "$env:APIUSER"
$BeaconServer = "$env:BEACONSERVER"
$ClassicDB = "$env:CLASSICDB"
$CustomerName = "$env:CUSTOMERNAME"
$DBServer = "$env:APIServer"
$DriveLetter = "$env:DRIVELETTER"
$EDIHealthConfig = "$env:EDIHEALTHCONFIG"
$HibikiDB = "$env:HIBIKIDB"
$MMID = "$env:MMID"
$MofuMobiDB = "$env:MOFUMOBIDB"
$SBIPath = "$DriveLetter`:\SBI Programs\$CustomerName\"
$ServicePassword = "$env:SERVICEPASSWORD"
$ServiceUser = "$env:SERVICEUSER"
$SQLPassword = "$env:SQLPassword"
$SQLServer = "$env:SQLSERVER"
$SQLUser = "$env:SQLUser"
$TriumphDB = "$env:TRIUMPHDB"

$variableNameArray = @('apipassword','apiuser','BeaconServer','ClassicDB','CustomerName','DBServer','DriveLetter','EDIHealthConfig','HibikiDB','MMID','MofuMobiDB','SBIPath','ServicePassword','ServiceUser','SQLPassword','SQLServer','SQLUser', 'TriumphDB')

function doesVariableExist {
    param(
        [Parameter(Position=0, Mandatory=$True, ValueFromPipeline=$True)] [string] $VarName
    )
    $args = "env:"+$VarName
    Write-Output $args
    Test-Path $args
}

ForEach ($variableName in $variableNameArray) { # loops through variable list and tests to see if the environment variable exists.
    #write-output $variableName
    doesVariableExist -VarName $variableName
    }

ForEach ($variableName in $variableNameArray) { # loops through variable list and tests to see if the variable is null or an empty string.
    if ($variableName = $null) {
        write-output "$variableName is null"
    } elseif ($variableName = '') { 
        write-output "$variableName is an empty string - not a problem for BeaconServer and EDIHealthConfig."
    } else {}
}