https://www.elastic.co/guide/en/elasticsearch/reference/current/deb.html

10  wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
11  sudo apt-get install apt-transport-https
12  echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-6.x.list
13  sudo apt-get update && sudo apt-get install elasticsearch
14  sudo apt-get install elasticsearch
