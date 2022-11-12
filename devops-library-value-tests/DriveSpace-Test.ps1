$DriveLetter = "$env:DRIVELETTER"

$DriveLetter = "D"
$DriveLetter = $DriveLetter+":" #adds a colon to the variable for the test function


$driveSpaceReturn = Get-CimInstance -ClassName Win32_LogicalDisk | Select-Object -Property DeviceID,FreeSpace

function AlertError { 
    param( 
    [Parameter(Position=0, Mandatory=$True)] [int] $DSV
    )
    write-output $DSV
    if ($DSV -lt 5.0) {
        Write-Error "Less than 5GB detected on drive $DriveLetter" -ErrorAction Stop
        } else {
        Write-Host "More than 5GB detected on drive $DriveLetter"
        }   
}

foreach ($drive in $drivespacereturn) {
    #$driveFound = "False"
    if ($drive.DeviceID -eq $DriveLetter) {
        $DriveSpace = ($drive.FreeSpace / 1GB)
        $DriveSpace = [math]::Round($DriveSpace)
        $DriveFound = "True"
        write-host "$DriveSpace GB free on drive $DriveLetter."
        AlertError $DriveSpace
    } else {
        write-host "$drive.DeviceID not $DriveLetter, skipping..."
        }
    }