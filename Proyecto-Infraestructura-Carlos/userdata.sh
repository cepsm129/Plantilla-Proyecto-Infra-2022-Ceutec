#!/bin/bash

sudo yum update -y
sudo amazon-linux-extras install docker
sudo service docker start
sudo systemctl enable docker
sudo usermod -a -G docker ec2-user
sudo docker pull bharathshetty4/supermario
sudo docker run -d -p 8600:8080 bharathshetty4/supermario