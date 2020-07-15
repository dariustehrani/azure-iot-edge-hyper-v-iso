#!/bin/sh
DEBIAN_FRONTEND=noninteractive
AZ_REPO=$(lsb_release -cs)


# echo \"deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main\" | sudo tee /etc/apt/sources.list.d/azure-cli.list
# apt-key --keyring /etc/apt/trusted.gpg.d/Microsoft.gpg adv --keyserver packages.microsoft.com --recv-keys BC528686B50D79E339D3721CEB3E94ADBE1229CF
# apt-key adv --keyserver packages.microsoft.com --recv-keys 417A0893
# apt-get update && apt-get install azure-cli

# IoT Edge install https://docs.microsoft.com/en-us/azure/iot-edge/how-to-install-iot-edge-linux

curl https://packages.microsoft.com/config/ubuntu/18.04/multiarch/prod.list > ./microsoft-prod.list
cp ./microsoft-prod.list /etc/apt/sources.list.d/
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
cp ./microsoft.gpg /etc/apt/trusted.gpg.d/
apt-get update -y
apt-get install moby-engine moby-cli -y

# MAKE SURE TO PIN THIS TO A FIXED VERSION FOR PRODUCTION
apt-get install iotedge -y