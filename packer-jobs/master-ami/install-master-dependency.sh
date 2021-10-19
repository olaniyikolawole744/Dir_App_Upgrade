#!/bin/bash
echo "inside jenkins dependency..........................."

#Installing Dependencies
echo "updating repos........................................"
sudo yum update -y

echo "installing  yum-utils..............................."
sudo yum install yum-utils -y

#sudo yum update -y
echo "installing git......................................"
sudo yum install git -y

#sudo yum update -y
echo "installing java...................................."
sudo yum install java -y

#sudo yum update -y
echo "installing epel..................................."
sudo amazon-linux-extras install epel -y

echo "installing daemonize.............................."
sudo yum install daemonize -y

echo "downloading pip..................................."
sudo wget https://bootstrap.pypa.io/pip/2.7/get-pip.py

echo "installing pip...................................."
sudo python get-pip.py

echo "instaling boto..................................."
sudo pip install boto

#Install Docker Module
echo "Installing python docker module.................."

git clone https://github.com/pypa/pip
cd pip
sudo pip install docker-py

#Install Ansible
echo "installing ansible....."
sudo yum update -y
sudo amazon-linux-extras install ansible2 -y



