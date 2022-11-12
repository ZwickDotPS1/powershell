$DriveLetter = "$env:DRIVELETTER"

# This test verifies the drive letter for the SBI Programs folder, is the first non-db test because other tests depend on it.

try {
    get-item "$($DriveLetter):\SBI Programs\" -ErrorAction Stop
    Write-Warning "drivelettertest: PASSED"
} catch {
    $ErrorMessage = $_.Exception.Message
    $FailedItem = $_.Exception.ItemName
    Write-Error "$($ErrorMessage) in $($faileditem)"
    Break }
