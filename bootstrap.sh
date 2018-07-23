#!/usr/bin/env bash

# Pick 'n choose, build your box

COMMON=true
WEBSERVER=true
PYTHON=false
DOCKER=false
NODEJS=false
JAVAJDK=false
ELASTICSEARCH=false

# - Install common stuff
if $COMMON ; then
  apt-get update
  apt-get install -y htop git curl net-tools
  apt-get install -y apt-transport-https
  # apt-get install cifs-utils
fi

# - Install webserver stuff
if $WEBSERVER ; then
  apt-get install -y nginx
  if ! [ -L /var/www ]; then
    rm -rf /var/www
    mkdir /var/www
    ln -s /taco_shared/www /var/www/html
  fi
fi

# - Install Python stuff
if $PYTHON ; then
  curl --silent https://bootstrap.pypa.io/get-pip.py -o get-pip.py
  python get-pip.py
  apt-get install -y python-dev
fi

# - Install Docker
if $DOCKER ; then
  # https://www.itzgeek.com/how-tos/linux/debian/how-to-install-docker-on-debian-9.html
  # https://www.itzgeek.com/how-tos/linux/how-to-build-docker-images-with-dockerfile.html
  # https://hub.docker.com/_/nginx/
  echo ############ Install Docker
  apt-get install -y apt-transport-https ca-certificates wget software-properties-common
  wget --quiet https://download.docker.com/linux/debian/gpg
  apt-key add gpg
  echo "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | tee -a /etc/apt/sources.list.d/docker.list
  apt-get update
  apt-cache policy docker-ce
  apt-get -y install docker-ce
  systemctl enable docker
  docker run hello-world
fi

# - Install NodeJS
if $NODEJS ; then
  curl -sL https://deb.nodesource.com/setup_6.x | bash -
  apt-get install -y nodejs
  npm install npm --global
fi

# - Install Java JDK
if $JAVAJDK ; then
  https://www.digitalocean.com/community/tutorials/how-to-install-java-with-apt-get-on-debian-8
  echo Install Java JDK
  apt-get install -y default-jdk
fi

# - Install elasticsearch 6.3.1 manually, requires JAVA JDK/JRE
if $ELASTICSEARCH ; then
  Source doc: https://www.elastic.co/guide/en/elasticsearch/reference/current/deb.html
  Test es: curl -X GET "localhost:9200/"

  echo Fetch, install, and configure elasticsearch
  wget --quiet https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.3.1.deb
  dpkg --install elasticsearch-6.3.1.deb
  echo 'network.host: 0.0.0.0' >> /etc/elasticsearch/elasticsearch.yml
  # echo 'cluster.name: koster-kluster' >> /etc/elasticsearch/elasticsearch.yml
  # echo 'discovery.zen.ping.unicast.hosts: ["10.0.1.215", "10.0.1.216"]' >> /etc/elasticsearch/elasticsearch.yml
  systemctl daemon-reload
  systemctl enable elasticsearch.service
  systemctl start elasticsearch.service
fi

echo Updating bash_aliases
#
echo alias ll=\'ls -lat\' >> /home/vagrant/.bash_aliases

echo Run stuff and things
#
/usr/bin/env
/sbin/ifconfig -a | grep 'inet '
