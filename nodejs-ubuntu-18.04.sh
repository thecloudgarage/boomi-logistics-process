#!/bin/bash
curl -sL https://raw.githubusercontent.com/creationix/nvm/v0.35.3/install.sh -o install_nvm.sh
bash install_nvm.sh
source ~/.profile
nvm install v14.17.0
nvm use v14.17.0
npm config set user 0
npm config set unsafe-perm true
