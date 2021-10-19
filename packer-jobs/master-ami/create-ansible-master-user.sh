#!/bin/bash

# CREATE USER
username="ansible"
sudo useradd $username
echo "$username ALL=(ALL) NOPASSWD:ALL" | sudo tee -a /etc/sudoers
sudo mkdir /home/$username/.ssh
sudo chmod 700 /home/$username/.ssh
sudo touch /home/$username/.ssh/authorized_keys
sudo chmod 600 /home/$username/.ssh/authorized_keys
sudo touch /home/$username/.ssh/id_rsa
sudo chmod 600 /home/$username/.ssh/id_rsa
sudo touch /home/$username/.ssh/id_rsa.pub
sudo chown -R ansible:ansible /home/ansible/.ssh



# CONFIGURE SSH KEYS
sudo cp /tmp/tf-packer /home/$username/.ssh/id_rsa
sudo cp /tmp/tf-packer.pub /home/$username/.ssh/id_rsa.pub
sudo cp /tmp/tf-packer.pub /home/$username/.ssh/authorized_keys
#sudo cp /tmp/get-pip.py /home/$username/get-pip.py