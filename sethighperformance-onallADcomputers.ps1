# Sets Power Management to 'High Performance" on all AD systems

Import-Module ActiveDirectory
$cred = get-credential

Get-ADComputer -Filter * -SearchBase "DC=zwicknet,DC=pri" | foreach {

    Invoke-Command -ComputerName $_.DNSHostname -Credential $cred -ScriptBlock {
        $powerPlan = Get-WmiObject -Namespace root\cimv2\power -Class Win32_PowerPlan -Filter "ElementName = 'High Performance'"
        $powerPlan.Activate()
    }
}