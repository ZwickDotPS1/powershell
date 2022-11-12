$ipaddr = import-csv D:\temp\iplist.csv

foreach ($ip in $ipaddr) {
    $curraddr = $($ip.ipaddr)
    $uri = 'https://api.ipgeolocation.io/ipgeo?apiKey=d3732e6899364aac8531023775528699&ip='+$curraddr
    Resolve-DnsName -name $($ip.ipaddr)
    curl $uri -UseBasicParsing
}