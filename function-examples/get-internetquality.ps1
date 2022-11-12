# Function for testing internet quality over the course of 24 hours
$LoopCount=1

function CreateLogFile {
    New-Item -Path "c:\" -Name "temp" -ItemType "directory"
    New-Item -Path "c:\temp" -Name "logs" -ItemType "directory"
}

# Creates C:\Temp\Logs folder if the folder doesn't already exist
try {
    Get-Item -Path 'C:\Temp\Logs' -ErrorAction Stop
}
catch {
    CreateLogFile
}

# Pings a public DNS server run by Comcast 10 times every 30 minutes. Will stop after 48 loops. Will create 48 log files in the end. 
function pingtest {
    ping 75.75.75.75 -n 10 | Out-File -FilePath "c:\temp\logs\ping-log$i.txt"
    start-sleep -Seconds 1800
    Write-Host "Loop $LoopCount"
}

for(;$LoopCount -le 49;$LoopCount++){
    pingtest
}

