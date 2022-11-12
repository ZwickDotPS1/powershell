# Sends a cURL request to api.ipgeolocation.io and returns the geographic location of every ISP in the list; used for identifying the source of unexpected traffic.

$ipaddr = import-csv D:\temp\iplist.csv

foreach ($ip in $ipaddr) {
    #Write-Output $userobject
    $curraddr = $($ip.ipaddr)
    $uri = 'https://api.ipgeolocation.io/ipgeo?apiKey=d3732e6899364aac8531023775528699&ip='+$curraddr
    write-output $uri
    curl $uri -UseBasicParsing
}