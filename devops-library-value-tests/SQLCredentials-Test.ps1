$SQLPassword = "$env:SQLPassword"
$SQLServer = "$env:SQLSERVER"
$SQLUser = "$env:SQLUser"
$TriumphDB = "$env:TRIUMPHDB"

# This function creates a database connection string using sqlServer, DBName, SQLUser and SQLPassword
# It will then try to open a connection to the DB, and if successful it returns a PS object with the values tested and the time to connect.
# This is for readability, and might provide useful data. SQL connection speed data can't hurt, anyway.

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

testSqlCredentials -Server $SQLServer -Database $TriumphDB -Username $SQLUser -Password $SQLPassword