# Script to promote Server 2019 Core to a domain controller

$DomainName = "DOMAINNAME"
$Credentials = (Get-Credential)

Install-ADDSDomainController -DomainName $DomainName -InstallDns:$true -Credential $Credentials