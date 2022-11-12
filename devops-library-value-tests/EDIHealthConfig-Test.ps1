$EDIHealthConfig = "$env:EDIHEALTHCONFIG"

# EDIHEALTHCONFIG exists, but is not really used at the moment per Gillan. 
# However, the deply may fail if this is not an empty string, so this test verifies that's the case.

if ($EDIHealthConfig -like '') {
    Write-Warning "ediHealthConfigTest: PASSED"
} else {
    Write-Error "ediHealthConfigTest: FAILED - parameter should be an empty string."
}
