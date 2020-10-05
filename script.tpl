#!/bin/bash
sudo yum install httpd -y
echo "Welcome to my Devops Page" > /var/www/html/index.html
sudo yum update -y
sudo service httpd start