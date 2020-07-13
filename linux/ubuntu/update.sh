#!/bin/sh
DEBIAN_FRONTEND=noninteractive
AZ_REPO=$(lsb_release -cs)

# Update the box
apt-get -y update
apt-get -y dist-upgrade

# Apt dependencies
apt-get -y install linux-virtual-lts-xenial linux-tools-virtual-lts-xenial linux-cloud-tools-virtual-lts-xenial
apt-get install apt-transport-https lsb-release software-properties-common dirmngr dkms curl git -y

