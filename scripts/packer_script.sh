#!/bin/bash

#CREATE AMIS
#echo "creating ami......................"
cd ..
cd packer-jobs
ls
cd agent-ami
ls
/usr/bin/packer fmt .
/usr/bin/packer init agent_ami.pkr.hcl
/usr/bin/packer build agent_ami.pkr.hcl
cd ..


cd master-ami
ls
/usr/bin/packer init ansible_master_ami.pkr.hcl
/usr/bin/packer build ansible_master_ami.pkr.hcl

/usr/bin/packer init jenkins_master_ami.pkr.hcl
/usr/bin/packer build jenkins_master_ami.pkr.hcl