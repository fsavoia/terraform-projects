#!/bin/bash

yum update -y
yum install -y httpd
echo '<h1>Hello World From EC2 via Terraform!</h1>' > /var/www/html/index.html
systemctl start httpd
systemctl enable httpd