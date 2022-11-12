# A script I wrote to connect the C$ share from every computer in the network 192.168.86.0/24 starting at .5 and ending at .12
# I no longer do this as it's bad security practice.

$cred = (Get-Credential)

for ($num = 5 ; $num -le 13 ; $num++){
    $ipaddr = "192.168.86.$num"
    $connectstring = "\\$ipaddr\c$"
    $drivename = "drive-$num"
    New-PSDrive -Name $drivename -PSProvider FileSystem -Root $connectstring -Credential $cred -Confirm 
    }