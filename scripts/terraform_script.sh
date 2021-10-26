#!/bin/bash

#CREATE INFRASTRUCTURE
cd ..
cd terraform-jobs
ls

echo creating "VPC..................................... "
cd vpc
terraform init
terraform apply

echo "creating servers.................................."
cd ..
cd create-other-servers
terraform init
terraform apply '-var-file=infrastructure_values.tfvars' --auto-approve
cd ../

# ASSOCIATE SUBNETS TO ROUTE TABLE
cd subnet_rt_assoc
ls
terraform init
terraform apply --auto-approve
cd ../../