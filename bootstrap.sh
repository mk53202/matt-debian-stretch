#!/usr/bin/env bash

apt-get update
apt-get install -y htop nginx curl net-tools
curl --silent https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py

# curl -sL https://deb.nodesource.com/setup_6.x | bash -
# apt-get install -y nodejs
# npm install npm --global

# if ! [ -L /var/www ]; then
#   rm -rf /var/www
#   ln -fs /vagrant /var/www
# fi

echo alias ll=\'ls -lat\' >> ~/.bash_aliases
