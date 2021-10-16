#!/bin/bash

#INSTALLING DOCKER
echo "installing docker..."
sudo amazon-linux-extras install docker -y
sudo service docker start
#sudo usermod -a -G docker ec2-user
