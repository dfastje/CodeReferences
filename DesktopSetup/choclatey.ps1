#https://chocolatey.org/install
Get-ExecutionPolicy
    #Restricted
Set-ExecutionPolicy AllSigned
Get-ExecutionPolicy
    #Restricted
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
#Restart powershell
choco
    #Chocolatey v2.0.0
#https://community.chocolatey.org/packages/ChocolateyGUI/2.0.0 (check for latest stable release)
choco install chocolateygui