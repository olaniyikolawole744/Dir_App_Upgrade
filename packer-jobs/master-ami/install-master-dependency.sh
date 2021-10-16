#!/bin/bash


#Installing Dependencies
sudo yum update -y
sudo yum install yum-utils -y
sudo yum update -y
sudo yum install git -y
sudo yum update -y
sudo yum install java -y
sudo yum update -y
sudo amazon-linux-extras install epel -y
sudo yum install daemonize -y
sudo wget https://bootstrap.pypa.io/pip/2.7/get-pip.py
sudo python get-pip.py
sudo pip install boto
#sudo yum install docker python-docker-py -y

#Install Docker Module
echo "Installing python docker module....."
#sudo yum install pip -y
#sudo yum install docker -y
git clone https://github.com/pypa/pip
cd pip
sudo pip install docker-py

#sudo python /home/ansible/get-pip.py
#sudo python get-pip.py
#sudo pip install boto
#sudo chown -R ansible:ansible /home/ansible/.ssh

