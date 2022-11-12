# Installed Powershell 7 on every computer in my AD domain in a previous server stack setup

Import-Module ActiveDirectory

$cred = get-credential

Get-ADComputer -Filter * -SearchBase "DC=zwicknet,DC=pri" | foreach {

    Invoke-Command -ComputerName $_.DNSHostname -Credential $cred -ScriptBlock {
        start-process -FilePath "c:\temp\PowerShell-7.1.4-win-x64.msi"
    }
}