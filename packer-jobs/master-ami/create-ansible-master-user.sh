#!/bin/bash

# CREATE USER
#username="ansible"
#sudo useradd $username
#echo "$username ALL=(ALL) NOPASSWD:ALL" | sudo tee -a /etc/sudoers
#sudo mkdir /home/$username/.ssh
#sudo chmod 700 /home/$username/.ssh


#sudo touch /home/$username/.ssh/authorized_keys
#sudo touch /home/$username/.ssh/id_rsa
#sudo touch /home/$username/.ssh/id_rsa.pub


#sudo cp /tmp/tf-packer /home/$username/.ssh/id_rsa
#sudo cp /tmp/tf-packer.pub /home/$username/.ssh/id_rsa.pub
#sudo cp /tmp/tf-packer.pub /home/$username/.ssh/authorized_keys


#sudo chmod 600 /home/$username/.ssh/authorized_keys
#sudo chmod 600 /home/$username/.ssh/id_rsa
#sudo chown -R ansible:ansible /home/ansible/.ssh

# CONFIGURE SSH KEYS
#ansible-vault   decrypt /tmp/tf-packer --vault-password-file $ANSIBLE_VAULT_PASSWORD_FILE 


# Setup sudo to allow no-password sudo for "ansible" user
sudo groupadd -r sudo 
sudo useradd -m -s /bin/bash ansible
sudo usermod -a -G sudo ansible
sudo cp /etc/sudoers /etc/sudoers.orig
echo "ansible ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/ansible

# Installing SSH key
sudo mkdir -p /home/ansible/.ssh
sudo chmod 700 /home/ansible/.ssh
sudo cp /tmp/tf-packer /home/ansible/.ssh/id_rsa
sudo chmod 600 /home/ansible/.ssh/id_rsa
sudo cp /tmp/tf-packer.pub /home/ansible/.ssh/id_rsa.pub
sudo cp /tmp/tf-packer.pub /home/ansible/.ssh/authorized_keys
sudo chmod 600 /home/ansible/.ssh/authorized_keys
sudo chown -R ansible:ansible /home/ansible/.ssh
sudo usermod --shell /bin/bash ansible