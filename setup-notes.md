New-VMSwitch -Name "InternalNAT" -SwitchType Internal

PS C:\Users\AzureUser> Get-NetAdapter

Name                      InterfaceDescription                    ifIndex Status       MacAddress             LinkSpeed
----                      --------------------                    ------- ------       ----------             ---------
vEthernet (InternalNAT)   Hyper-V Virtual Ethernet Adapter #2          16 Up           00-15-5D-01-04-00        10 Gbps
vEthernet (Microsoft H... Hyper-V Virtual Ethernet Adapter              2 Up           00-0D-3A-20-77-B7        50 Gbps
Ethernet                  Microsoft Hyper-V Network Adapter             5 Up           00-0D-3A-20-77-B7        50 Gbps


New-NetIPAddress -IPAddress 192.168.0.1 -PrefixLength 24 -InterfaceIndex 16

New-NetNat -Name "InternalNat" -InternalIPInterfaceAddressPrefix 192.168.0.0/24

PS C:\Users\AzureUser> Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProto
col = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadStrin
g('https://chocolatey.org/install.ps1'))

choco install packer

https://github.com/camjjack/hyper-v-packer-templates

PS C:\Users\AzureUser> New-NetFirewallRule -DisplayName "Packer_http_server" -Direction Inbound -Action Allow -Protocol
TCP -LocalPort 8000-9000


https://github.com/camjjack/hyper-v-packer-templates

choco install ruby

Get-VMSwitch
$Env:hyperv_switchname = "InternalNAT"

