#!/bin/bash

# CREATE USER
username="jenkins"
sudo useradd $username
echo "$username ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/$username
sudo mkdir /home/$username/.ssh
sudo chmod 700 /home/$username/.ssh
sudo mkdir /home/$username/.ssh/authorized_keys
sudo chmod 600 /home/$username/.ssh/authorized_keys
sudo mkdir /home/$username/.ssh/id_rsa.pub
sudo chown -R jenkins:jenkins /home/jenkins/.ssh

# CONFIGURE SSH KEYS
sudo cp /tmp/tf-packer.pub /home/$username/.ssh/id_rsa.pub
sudo cp /tmp/tf-packer.pub /home/$username/.ssh/authorized_keys