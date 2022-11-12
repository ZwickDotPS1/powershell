# Another server used to install Powershell 7 on every computer in my AD domain in a previous server stack setup, using the UNC path instead of a local path

Import-Module ActiveDirectory
$cred = get-credential
Get-ADComputer -Filter * -SearchBase "DC=zwicknet,DC=pri" | foreach {

    Invoke-Command -ComputerName $_.DNSHostname -Credential $cred -ScriptBlock {
        $name = $_.DNSHostName
        write-host $name
        start-process -FilePath "\\192.168.86.5\Documents\server-mgmt-scripts\deploy-pack\apps\PowerShell-7.1.4-win-x64.msi"
    }
}