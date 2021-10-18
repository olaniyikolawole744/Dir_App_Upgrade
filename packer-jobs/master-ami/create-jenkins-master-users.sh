#!/bin/bash

# CREATE USER
username="jenkins"
sudo useradd $username
echo "$username ALL=(ALL) NOPASSWD:ALL" | sudo tee -a /etc/sudoers
sudo mkdir /home/$username/.ssh
sudo chmod 700 /home/$username/.ssh
sudo mkdir /home/$username/.ssh/authorized_keys
sudo chmod 600 /home/$username/.ssh/authorized_keys
sudo mkdir /home/$username/.ssh/id_rsa
sudo chmod 600 /home/$username/.ssh/id_rsa
sudo mkdir /home/$username/.ssh/id_rsa.pub

# CONFIGURE SSH KEYS
sudo cp /tmp/tf-packer /home/$username/.ssh/id_rsa
sudo cp /tmp/tf-packer.pub /home/$username/.ssh/id_rsa.pub
sudo cp /tmp/tf-packer.pub /home/$username/.ssh/authorized_keys
#sudo cp /tmp/get-pip.py /home/$username/get-pip.py
