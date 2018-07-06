#!/usr/bin/env bash

# Pick 'n choose, build your box

# - Install common stuff
apt-get update
apt-get install -y htop git curl net-tools
apt-get install -y apt-transport-https

# - Install webserver stuff
# apt-get install -y nginx
# if ! [ -L /var/www ]; then
#   rm -rf /var/www
#   mkdir /var/www
#   ln -s /vagrant/www /var/www/html
# fi

# - Install Python stuff
# curl --silent https://bootstrap.pypa.io/get-pip.py -o get-pip.py
# python get-pip.py
# apt-get install -y python-dev

# - Install Nodejs
# curl -sL https://deb.nodesource.com/setup_6.x | bash -
# apt-get install -y nodejs
# npm install npm --global

# - Install java JDK
# https://www.digitalocean.com/community/tutorials/how-to-install-java-with-apt-get-on-debian-8
echo Install Java JDK
apt-get install -y default-jdk

# - Install elasticsearch 6.3.1 manually, requires JAVA JDK/JRE
# Source doc: https://www.elastic.co/guide/en/elasticsearch/reference/current/deb.html
# Test es: curl -X GET "localhost:9200/"
echo Install elasticsearch
wget --quiet https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.3.1.deb
dpkg --install elasticsearch-6.3.1.deb
systemctl daemon-reload
systemctl enable elasticsearch.service
systemctl start elasticsearch.service


echo Updating bash_aliases
#
echo alias ll=\'ls -lat\' >> /home/vagrant/.bash_aliases

echo Run stuff and things
#
/usr/bin/env
/sbin/ifconfig -a | grep 'inet '
