# Started to custom build a script for a client to clear our redirected printer drivers from the registry, because it would sometimes prevent SBI customers from printing reports.
# It was targeted because this client used a legacy version of the software and needed her printer driver redirects in place or she could not send invoices.

$usernameArr = @('USERNAME1', 'USERNAME2', 'USERNAME3')

foreach ($u in $usernameArr) {
    Remove-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows NT\CurrentVersion\PrinterPorts' -Name "*"
    Remove-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows NT\CurrentVersion\Devices' -Name "*"
}