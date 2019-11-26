#!/bin/sh

set -e
set -u

## TODO: modifier cette ligne

HOSTNAME="$(hostname)"
ID=$(cat /etc/os-release | awk -F= '/^ID=/{print $2}' | tr -d '"')
VERS=$(cat /etc/os-release | awk -F= '/^VERSION_ID=/{print $2}' | tr -d '"')

export DEBIAN_FRONT=noninteractive
apt-get update
apt-get install -y \
    apt-transport-https \
    ca-certificates \
    git \
    curl \
    wget \
    vim \
    gnupg2 \
    software-properties-common

# on telecharge leur clé GPG et on les autorise a signer  

curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

#J'ajoute la réference vers le dêpot debian 
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"

# On telecharge le catalogue des paquets 
apt-get update

# On installe les paquets relatifs à Docker 
apt-get install -y docker-ce docker-ce-cli containerd.io

echo "SUCCESS."

