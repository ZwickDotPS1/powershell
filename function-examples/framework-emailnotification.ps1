# Describe the job
# $test = "test" # to test, uncomment this line and place the variable in each empty string
$jobname = "$test" 

# Where is it running?
$servername = "$test"

# Who do I notify when done?
$SAemail = "jenna@sbiteam.com" 

# What's the track case id?
$caseid = "$test"

# What function do you want to run?
$function = Start-Sleep -Seconds 30

# leave these variables alone
$trackurl = "https://track.sbiteam.com/editcase.aspx?id=$caseid" 
$From = "Hardware@sbiteam.com"
$To = "$SAemail"
$SMTPServer = "smtp-relay.gmail.com"
$SMTPPort = "587"
$Body = "$trackurl"

# core function logic 
function successemail {
    $Subject = "SUCCESS - Completed job $jobname on $servername"
    Send-MailMessage -From $From -to $To -Subject $Subject -Body $Body -SmtpServer $SMTPServer -port $SMTPPort
}

function erroremail {
    $Subject = "FAILED - Job $jobname  on $servername"
    Send-MailMessage -From $From -to $To -Subject $Subject -Body $Body -SmtpServer $SMTPServer -port $SMTPPort
}

function runfunction {
    $function
}

Try { 
    runfunction
    successemail
} 
Catch {
    erroremail
}