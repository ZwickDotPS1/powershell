$variableNameArray = @('apipassword',
    'apiuser',
    'ClassicDB',
    'CustomerName',
    'DriveLetter',
    'HibikiDB',
    'MMID',
    'MofuMobiDB',
    'ServicePassword',
    'ServiceUser',
    'SQLPassword',
    'SQLServer',
    'SQLUser', 
    'TriumphDB')

# prepares a string "env:($varname) to pass to Test-Path. This true/false check shows if the env variable exists, reports to console"
function doesVariableExist { 
    param(
        [Parameter(Position=0, Mandatory=$True, ValueFromPipeline=$True)] [string] $VarName
    )
    $args = "env:"+$VarName
    Write-Output $args
    Test-Path $args 
}

# loops through variable list and tests to see if the environment variable exists.
ForEach ($variableName in $variableNameArray) { 
    #write-output $variableName
    doesVariableExist -VarName $variableName
    }