dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all
Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform

# run this section after restarting

function FinishInstall {
    wsl --set-default-version 2
    Invoke-WebRequest -Uri https://aka.ms/wslubuntu2004 -OutFile c:\temp\Ubuntu.appx -UseBasicParsing
    Add-AppxPackage c:\temp\Ubuntu.appx
}