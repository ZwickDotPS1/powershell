$ServicePassword = "$env:SERVICEPASSWORD"
$ServiceUser = "$env:SERVICEUSER"

# serviceCredTest() creates an active directory connection object using $ServiceUser and $ServicePassword.
# If there's a \ in $env:ServiceUser, the error handler will split the string after the slash and update $ServiceUser before running the test

function serviceCredTest {
    Add-Type -AssemblyName System.DirectoryServices.AccountManagement
    $DS = New-Object System.DirectoryServices.AccountManagement.PrincipalContext('domain')
    $result = $DS.ValidateCredentials($ServiceUser, $ServicePassword)
    write-output $result
}

if($ServiceUser -like '*\*') {
    $split = ($ServiceUser -split '\\')
    $ServiceUser = $split[1]
    write-host 'On-prem client detected. Running test with on-prem parameters.'
    serviceCredTest
} else {
    Write-host 'Cloud client detected. Running test with cloud parameters.'
    serviceCredTest
}