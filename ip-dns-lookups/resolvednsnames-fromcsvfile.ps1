# outputs the DNS name for a list of IP addresses - used for identifying the source of unexpected traffic.
$userobjects = Import-CSV d:\temp\iplist.CSV

foreach ($userobject in $userobjects) {
    Resolve-DnsName -name $($userobject.Source)
}
