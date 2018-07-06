#!/usr/bin/env bash

# Pick 'n choose build your box

# Common stuff
apt-get update
apt-get install -y htop git curl net-tools
apt-get install -y apt-transport-https

# << Web Server >>
# apt-get install -y nginx
# if ! [ -L /var/www ]; then
#   rm -rf /var/www
#   mkdir /var/www
#   ln -s /vagrant/www /var/www/html
# fi

# Base Python stuff
# curl --silent https://bootstrap.pypa.io/get-pip.py -o get-pip.py
# python get-pip.py
# apt-get install -y python-dev

# curl -sL https://deb.nodesource.com/setup_6.x | bash -
# apt-get install -y nodejs
# npm install npm --global


echo Updating bash_aliases
#
echo alias ll=\'ls -lat\' >> /home/vagrant/.bash_aliases

echo Other stuff and things
#
/usr/bin/env
/sbin/ifconfig -a | grep 'inet '
