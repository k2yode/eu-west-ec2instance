#!/bin/bash
sudo yum install httpd -y
echo "Welcome to my First EC2 Instance Web Server" > /var/www/html/index.html
sudo yum update -y
sudo service httpd start