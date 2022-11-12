# Creates an array of the emails of the hardware team members at SBI
$emails = @('jenna@sbiteam.com','adam@sbiteam.com','brian@sbiteam.com')

# Gets today's date for the subject line
$date = (Get-Date -Format 'MM-dd-yyyy')

# Sends email to an open SMTP relay, example is written for Google Workspace
function tipoftheday($To) {
    $subject = "[$date] Powershell Function of the Day"
    $from = "jenna@sbiteam.com"
    $SMTPServer = "example.relayserver.gmail.com"
    $SMTPPort = "587"
    $body = Get-Command -CommandType Cmdlet | Get-Random  | Get-Help | Out-String # Gets the help text of a random commandlet and outputs the text as a string
    Send-MailMessage -From $From -to $To -Subject $Subject -Body $Body -SmtpServer $SMTPServer -port $SMTPPort
    }

ForEach ($email in $emails) { # loops through email list and passes each email to the tipoftheday function
    tipoftheday($email)
    }