dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
wsl --set-default-version 2
wsl --install -d Ubuntu-20.04
wsl.exe --set-version Ubuntu-20.04 2
shutdown /r /t 60 /c "Installing WSL2 and Ubuntu 20.04"