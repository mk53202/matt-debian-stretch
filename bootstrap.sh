#!/usr/bin/env bash

apt-get update
apt-get install -y htop git nginx curl net-tools
apt-get install -y neofetch

curl --silent https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py
apt-get install -y python-dev

# curl -sL https://deb.nodesource.com/setup_6.x | bash -
# apt-get install -y nodejs
# npm install npm --global

echo Creating softlink to vagrant for /var/www
#
if ! [ -L /var/www ]; then
  rm -rf /var/www
  mkdir /var/www
  ln -s /vagrant/www /var/www/html
fi

echo Updating bash_aliases
#
echo alias ll=\'ls -lat\' >> /home/vagrant/.bash_aliases

echo Other stuff and things
#
/usr/bin/env
/sbin/ifconfig -a | grep 'inet '
