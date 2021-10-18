# EC2 INSTANCE ARGUMENT VALUES
ami_values                  = ["ansible_master_ami","agent_ami","agent_ami"]
instance_type               = "t2.medium"
key_name                    = "win-on-mac.pem"
server_name                 = ["ansible","dev","prod"]
role                        = "dir_app"
environment                 = "prod"
name_list_index             = "1"
name                        = ""
server_amis                 = ""
#user_data                   = ""

# SECURITY GROUP ARGUMENT VALUES
from_port = "22"
to_port   = "22"

from_port2 = ["22","8080","8080"]
to_port2 = ["22","8080","8080"]

protocol  = "tcp"

# SUBNET ARGUMENT VALUES
public_subnet_cidr_block = ["40.0.10.0/24","40.0.20.0/24","40.0.30.0/24"]
availability_zone_marker   = ["a","b","c"]

# BACKEND ARGUMENT VALUE
backend_key = ["dir-app/ansible/terraform.tfstate","dir-app/dev/terraform.tfstate","dir-app/prod/terraform.tfstate"]

# AWS ARGUMENT VALUE
region = "us-east-1"