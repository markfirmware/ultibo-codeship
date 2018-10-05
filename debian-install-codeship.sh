#!/bin/bash
set -e

#NEWHOSTNAME=$1
#if [[ $NEWHOSTNAME != "" ]]
#then
#    hostname $NEWHOSTNAME
#fi

GITNAME=$1

apt-get update && apt-get -y dist-upgrade && apt-get -y install fail2ban
apt-get -y install build-essential tmux git

if [[ $GITNAME != "" ]]
then
    git config --global user.name $GITNAME
    git config --global user.email $GITNAME.users.noreply.github.com
fi

if [[ $(which nim) == "" ]]
then
    curl https://nim-lang.org/choosenim/init.sh -sSf | sh -s -- -y
    echo 'export PATH=~/.nimble/bin:$PATH' >> .bashrc
fi

if [[ $(which jet) == "" ]]
then
    curl -SLO "https://s3.amazonaws.com/codeship-jet-releases/2.8.0/jet-linux_amd64_2.8.0.tar.gz"
    tar -xaC /usr/local/bin -f jet-linux_amd64_2.8.0.tar.gz
    chmod +x /usr/local/bin/jet
    rm jet-linux_amd64_2.8.0.tar.gz
else
    jet update
fi

apt-get -y install \
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common
curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | sudo apt-key add -
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
   $(lsb_release -cs) \
   stable"
apt-get update
apt-get -y install docker-ce
