$SQLPassword = "$env:SQLPASSWORD"
$SQLServer = "$env:SQLSERVER"
$SQLUser = "$env:SQLUSER"
$ClassicDB = "$env:CLASSICDB"

# This function tests that the value for $ENV:CLASSICDB is correct by creating a connection object, 
# timing the connection time, them terminating.

function testSqlCredentials {
    param( 
    [Parameter(Position=0, Mandatory=$True, ValueFromPipeline=$True)] [string] $Server,
    [Parameter(Position=1, Mandatory=$True)] [string] $Database,
    [Parameter(Position=2, Mandatory=$True, ParameterSetName="SQLAuth")] [string] $Username,
    [Parameter(Position=3, Mandatory=$True, ParameterSetName="SQLAuth")] [string] $Password
    )
    # connect to the database, then immediatly close the connection. If an exception occurrs it indicates the conneciton was not successful. 
    process { 
        $dbConnection = New-Object System.Data.SqlClient.SqlConnection
        $dbConnection.ConnectionString = "Data Source=$Server; uid=$Username; pwd=$Password; Database=$Database;Integrated Security=False"
        $Authentication = "SQL ($Username)"
        try {
            $connectionTime = measure-command {$dbConnection.Open()}
            $Result = @{
                Connection = "Successful"
                ElapsedTime = $connectionTime.TotalSeconds
                Server = $Server
                Database = $Database
                User = $Authentication}
        }
        # exceptions will be raised if the database connection failed.
        catch {
                $Result = @{
                Connection = "Failed"
                ElapsedTime = $connectionTime.TotalSeconds
                Server = $Server
                Database = $Database
                User = $Authentication}
        }
        Finally{
            # close the database connection
            $dbConnection.Close()
            #return the results as an object
            $outputObject = New-Object -Property $Result -TypeName psobject
            write-output $outputObject 
        }
        
    }
}


testSqlCredentials -Server $SQLServer -Database $ClassicDB -Username $SQLUser -Password $SQLPassword