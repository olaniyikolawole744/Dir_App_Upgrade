#!/bin/bash

#CREATE AMIS
echo "creating ami....."
cd packer-jobs
ls
cd agent-ami
ls
packer fmt .
packer init agent_ami.pkr.hcl
packer build agent_ami.pkr.hcl
cd ..
cd master-ami
ls
packer init ansible_master_ami.pkr.hcl
packer build ansible_master_ami.pkr.hcl

# CREATE SERVERS
cd ../../
cd terraform-jobs
ls
cd create-other-servers
terraform init
terraform apply '-var-file=infrastructure_values.tfvars' --auto-approve
cd ../

# ASSOCIATE SUBNETS TO ROUTE TABLE
cd subnet_rt_assoc
ls
terraform init
terraform apply --auto-approve

# PLAY ANSIBLE PLAYBOOK 
#cd ..
#cd ansible-job
#ls

#export ANSIBLE_HOSTS=inventory/ec2.py
#export EC2_INI_PATH=inventory/ec2.ini
#cd inventory
#ls 
#sudo chmod 755 inventory/ec2.py
#sudo chmod 755 inventory/ec2.ini
#ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook playbook/playbookbroker.yml -i inventory/ec2.py
