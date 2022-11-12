$serverName = "localhost"
$count = 0


$sessions = qwinsta /server $serverName | Where-Object { $_ -notmatch '^ SESSIONNAME' } | ForEach-Object {
    $item = "" | Select-Object "Active", "SessionName", "Username", "Id", "State", "Type", "Device"
    $item.Active = $_.Substring(0, 1) -match '>'
    $item.SessionName = $_.Substring(1, 18).Trim()
    $item.Username = $_.Substring(19, 20).Trim()
    $item.Id = $_.Substring(39, 9).Trim()
    $item.State = $_.Substring(48, 8).Trim()
    $item.Type = $_.Substring(56, 12).Trim()
    $item.Device = $_.Substring(68).Trim()
    $item
} 

 

#Count this users logins
foreach ($session in $sessions) {
    if ($session.Username -eq $env:USERNAME) {
        $count++
        $session.Username
    }
}

 

#If  one, cleanup printers.
if ($count -le 1) {
    Remove-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows NT\CurrentVersion\PrinterPorts' -Name "*"
    Remove-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows NT\CurrentVersion\Devices' -Name "*"
}