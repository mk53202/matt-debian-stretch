# https://www.elastic.co/guide/en/elasticsearch/reference/current/deb.html

# wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
# echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-6.x.list
# sudo apt-get update && sudo apt-get install elasticsearch
# sudo apt-get install elasticsearch

wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.3.1.deb
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.3.1.deb.sha512
shasum -a 512 -c elasticsearch-6.3.1.deb.sha512
sudo dpkg --log=/tmp/es.log --install elasticsearch-6.3.1.deb
