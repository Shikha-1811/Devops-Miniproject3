#!/bin/bash
apt update -y
apt install wget unzip apache2 -y
systemctl start apache2
systemctl enable apache2
wget https://www.tooplate.com/zip-templates/2098_health.zip
unzip 2098_health.zip
cp -r 2098_health/* /var/www/html/
systemctl restart apache2