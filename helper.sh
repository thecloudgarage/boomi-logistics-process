#!/bin/bash
# VERIFIED ON UBUNTU 18.04
# After launch, give it a while to finish the installations via user-data

#INSTALL COMMON UTILITIES
sudo apt update -y
sudo apt install jq -y
sudo apt install wget -y
sudo apt install unzip -y

#INSTALL DOCKER-CE

sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update -y
apt-cache policy docker-ce
sudo apt install docker-ce -y
sudo service docker start
sudo usermod -aG docker ubuntu

#INSTALL DOCKER-COMPOSE
sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

#INSTALL KUBECTL

curl -Lo kubectl https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bi
n/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

#INSTALL AWS CLI

sudo apt-get update -y
sudo apt-get install awscli -y

#INSTALL NODEJS
echo 'export NVM_DIR="/.nvm"' >> ~/.bashrc
echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> ~/.bashrc
curl -sL https://raw.githubusercontent.com/creationix/nvm/v0.35.3/install.sh | bash
source /.nvm/nvm.sh
nvm install v14.17.0
nvm use v14.17.0
npm config set user 0
npm config set unsafe-perm true
