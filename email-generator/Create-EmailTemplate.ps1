# This is a script to generate an email formatted to work with SBI's in-house built ticketing system.
# I was planning to expand it with up to 10 other common emails I would write, but I ended up using the 'Canned Responses' feature in GMail instead. 



# Begin Main Variables

$SigBlock = (
write-host "`
_ _ _`
Contact us for quick help or if you have questions`n

* Chat one-on-one via [Live Chat](https://lc.chat/now/9389625/1) (available from 11amET/8amPT-8pmET/5pmPT)`n

* Create case or submit an emergency via [Client Tool](https://help.sbiteam.com/home)"`n
)

# End Main Variables

function templatePrivNote {
    
# Start Teplate Variable Block
$Name = Read-Host -Prompt "Input the contact's name"
$PrivNoteURL = Read-Host -Prompt "Paste the PrivNote URL Here"
# End Template Variable Block
    
Write-Host 
"`
Hi $Name, `
`n
Here are the passwords you wanted reset. `n
This is a 'self destructing' note, please print the page when you open it. It can only be opened once.
`n
Logins: [$PrivNoteURL]($PrivNoteURL)`
(Let me know if you get an error opening it saying it was already opened)`
`n
Cheers,`n
Jenna Miller`
SBI Infrastructure`
866-515-4909 x395`n
$SigBlock`n"
}

function templateSelect {
    if ($templateToUse = 1) {
        templatePrivNote
    } else { 
        Write-Warning -Message "Invalid selection"
        templateSelect
    }
}

function mainMenu {
    Write-Host "1) Privnote Credentials"
    $templateToUse = Read-Host -Prompt "Select the number of the template you'd like to use. [1-10]"
    templateSelect $templateToUse
}

mainMenu