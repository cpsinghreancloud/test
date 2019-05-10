#!/bin/sh
sudo apt-get update -y
sudo apt-get install nginx -y
echo "Yeah!!! This is Nginx Webserver. :)
"ufw allow 'Nginx HTTP'
sudo ufw allow 'Nginx HTTPS'
systemctl restart nginx
