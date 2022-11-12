$CustomerName = "$env:CUSTOMERNAME"
$DriveLetter = "$env:DRIVELETTER"
$DriveLetter = "$DriveLetter"+':'

# This test verifies a cloud customer's name by checking their SBI Programs folder path. 
# This test will fail if the client is on-prem.

try {
    write-output 'Please note: This test will fail if the client is on-prem. There is a separate test for on-prem clients.'
    write-output "_"
    write-output "_"
    $path1 = (Join-Path -Path $DriveLetter -Childpath "SBI Programs\$CustomerName")
    Write-Host $path1 -ForegroundColor red -BackgroundColor white
    Get-Item $path1 -ErrorAction Stop
} catch {
    $ErrorMessage = $_.Exception.Message
    $FailedItem = $_.Exception.ItemName
    Write-Error "$($ErrorMessage) in $($FailedItem)"
    Break }