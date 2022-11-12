$jobname = "" # Describe the job
$servername = "" # Where is it running?
$SAemail = "" # Who do I notify when done?
$trackurl = "" # Which case is this for?

function successemail {
    $From = "Hardware@sbiteam.com"
    $To = "$SAemail"
    $Subject = "SUCCESS - Completed job $jobname on $servername"
    $Body = "$trackurl"
    $SMTPServer = "smtp-relay.gmail.com"
    $SMTPPort = "587"
    Send-MailMessage -From $From -to $To -Subject $Subject -Body $Body -SmtpServer $SMTPServer -port $SMTPPort
}

function erroremail {
    $From = "Hardware@sbiteam.com"
    $To = "$SAemail"
    $Subject = "FAILED - Job $jobname on $servername"
    $Body = "$trackurl"
    $SMTPServer = "smtp-relay.gmail.com"
    $SMTPPort = "587"
    Send-MailMessage -From $From -to $To -Subject $Subject -Body $Body -SmtpServer $SMTPServer -port $SMTPPort
}

function runfunction {
    # Function goes here and will send a success email when completed.
    # ex. `7z a "$filepath\sbi-programs-archive-08102021.zip" $filepath\`
}

Try { 
    runfunction
    successemail
} 
Catch {
    erroremail
}