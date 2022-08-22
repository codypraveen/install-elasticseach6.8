#!/bin/bash

sudo apt update
sudo apt install -y apt-transport-https openjdk-8-jre-headless
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | sudo tee /etc/apt/sources.list.d/elastic-6.x.list
sudo apt update && sudo apt install -y elasticsearch
sudo /bin/systemctl daemon-reload
sudo /bin/systemctl enable elasticsearch.service
sudo systemctl start elasticsearch.service
sudo systemctl status elasticsearch.service
echo "Waiting for ElasticSearch to boot up..."
sleep 20
curl -XGET 'localhost:9200/?pretty'
