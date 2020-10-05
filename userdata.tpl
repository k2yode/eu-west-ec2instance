#!/bin/bash
sudo yum install httpd -y
echo "Welcome to my Devops Page II powered by TechBleat" > /var/www/html/index.html
sudo yum update -y
sudo service httpd start
sudo wget https://releases.hashicorp.com/terraform/0.13.4/terraform_0.13.4_linux_amd64.zip
sudo unzip terraform_0.13.4_linux_amd64.zip
sudo cp terraform /usr/bin/
sudo yum install tomcat
sudo service tomcat start