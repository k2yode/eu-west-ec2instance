#!/bin/bash
sudo yum install httpd -y
sudo yum update -y
sudo systemctl start httpd.service
sudo systemctl enable httpd.service
sudo wget https://releases.hashicorp.com/terraform/0.13.4/terraform_0.13.4_linux_amd64.zip
sudo unzip terraform_0.13.4_linux_amd64.zip
sudo cp terraform /usr/bin/
sudo yum install tomcat
sudo service tomcat start
EC2_AVAIL_ZONE=$(curl -s https://169.254.169.254/latest/meta-data/placement/availability-zone)
echo "<h1>Welcome to my Devops Page III powered by TechBleat in AZ $EC2_AVAIL_ZONE</h1>" > /var/www/html/index.html
