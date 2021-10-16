#!/bin/bash

#INSTALL ANSIBLE
echo "installing ansible....."
sudo yum update -y
sudo amazon-linux-extras install ansible2 -y

#INSTALL PACKER
echo "installing packer....."
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install packer

#INSTALL TERRAFORM
echo "installing terraform....."
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum install terraform -y

#INSTALL JENKINS
echo "installing jenkins....."
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum upgrade -y
sudo yum install jenkins -y
sudo systemctl daemon-reload
sudo systemctl start jenkins
#sudo yum install epel-release java-11-openjdk-devel

#INSTALLING DOCKER
echo "installing docker....."
sudo amazon-linux-extras install docker -y
sudo service docker start
#sudo usermod -a -G docker ec2-user

