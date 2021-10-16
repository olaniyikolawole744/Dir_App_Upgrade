#!/bin/bash

#Installing Dependencies
sudo yum update -y
sudo yum install java -y

#Install Docker Module
sudo yum install pip -y
sudo yum install docker -y
git clone https://github.com/pypa/pip
cd pip
sudo pip install docker-py

