$BeaconServer = "$env:BEACONSERVER"

# The Beacon variables exist, but are not really used at the moment per Tim. 
# However, the deply may fail if this is not an empty string, so this test verifies that's the case.

if ($BeaconServer -like '') { 
    Write-Warning "beaconServerTest: PASSED" 
} else { 
    Write-Error "beaconServerTest: FAILED -  parameter is not empty." 
}
