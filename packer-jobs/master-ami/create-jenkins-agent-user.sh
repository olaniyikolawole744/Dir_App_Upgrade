#!/bin/bash

# CREATE USER
#username="jenkins"
#sudo useradd $username
#echo "$username ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/$username
#sudo mkdir /home/$username/.ssh
#sudo chmod 700 /home/$username/.ssh


#sudo touch /home/$username/.ssh/authorized_keys
#sudo touch /home/$username/.ssh/id_rsa.pub


#sudo cp /tmp/tf-packer.pub  /home/$username/.ssh/id_rsa.pub
#sudo cp /tmp/tf-packer.pub  /home/$username/.ssh/authorized_keys


#sudo chmod 600 /home/$username/.ssh/authorized_keys
#sudo chown -R jenkins:jenkins /home/jenkins/.ssh

# CONFIGURE SSH KEYS

# Setup sudo to allow no-password sudo for "jenkins" user
sudo groupadd -r sudo
sudo useradd -m -s /bin/bash jenkins
sudo usermod -a -G sudo jenkins
sudo cp /etc/sudoers /etc/sudoers.orig
echo "jenkins ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/jenkins

# Installing SSH key
sudo mkdir -p /home/jenkins/.ssh
sudo chmod 700 /home/jenkins/.ssh
sudo cp /tmp/tf-packer.pub /home/jenkins/.ssh/authorized_keys
sudo chmod 600 /home/jenkins/.ssh/authorized_keys
sudo chown -R jenkins:jenkins /home/jenkins/.ssh
sudo usermod --shell /bin/bash jenkins
