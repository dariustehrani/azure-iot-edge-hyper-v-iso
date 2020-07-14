# Build a Hyper-V ISO for IoT Edge Runtime with Packer

* Install Hyper-V on an Azure SKU supporting nested VMs.
* Attach a Premium Storage disk with sufficient throughput 

# Networking Notes
-> from here run in Powershell+Admin Privs

````
New-VMSwitch -Name "InternalNAT" -SwitchType Internal
Get-NetAdapter ( and find InternalNAT in my case 16)

Name                      InterfaceDescription                    ifIndex Status       MacAddress             LinkSpeed
----                      --------------------                    ------- ------       ----------             ---------
vEthernet (InternalNAT)   Hyper-V Virtual Ethernet Adapter #2          16 Up           00-15-5D-01-04-00        10 Gbps
vEthernet (Microsoft H... Hyper-V Virtual Ethernet Adapter              2 Up           00-0D-3A-20-77-B7        50 Gbps
Ethernet                  Microsoft Hyper-V Network Adapter             5 Up           00-0D-3A-20-77-B7        50 Gbps
````

````
New-NetIPAddress -IPAddress 192.168.0.1 -PrefixLength 24 -InterfaceIndex 16
New-NetNat -Name "InternalNat" -InternalIPInterfaceAddressPrefix 192.168.0.0/24
````

# Managing Packer + dependencies on the Host through choco

## Install Choco
````
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProto
col = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadStrin
g('https://chocolatey.org/install.ps1'))
````

````
choco install packer
choco install openssh
choco install git
choco install ruby
ssh-keygen
````
### configure Windows Firewall
````
PS C:\Users\AzureUser> New-NetFirewallRule -DisplayName "Packer_http_server" -Direction Inbound -Action Allow -Protocol
TCP -LocalPort 8000-9000
````

REBOOT NOW!

## Set Environment Variables for Packer
Get-VMSwitch
$Env:hyperv_switchname = "InternalNAT"

