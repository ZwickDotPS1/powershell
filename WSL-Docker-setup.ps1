#Installs WSL, sets the version to WSL 2, then installs Ubuntu 20.04 on Windows 10 without using the Microsoft Store

# Run this section first and reopen the script after restarting if prompted

dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform

# Run this section after restarting

function FinishInstall {
    wsl --set-default-version 2
    Invoke-WebRequest -Uri https://aka.ms/wslubuntu2004 -OutFile c:\temp\Ubuntu.appx -UseBasicParsing
    Add-AppxPackage c:\temp\Ubuntu.appx
}