#!/bin/bash
set -e

pacman -Su --noconfirm docker

if [[ $(which jet) == "" ]]
then
    curl -SLO "https://s3.amazonaws.com/codeship-jet-releases/2.8.0/jet-linux_amd64_2.8.0.tar.gz"
    tar -xaC /usr/local/bin -f jet-linux_amd64_2.8.0.tar.gz
    chmod +x /usr/local/bin/jet
    rm jet-linux_amd64_2.8.0.tar.gz
else
    jet update
fi
