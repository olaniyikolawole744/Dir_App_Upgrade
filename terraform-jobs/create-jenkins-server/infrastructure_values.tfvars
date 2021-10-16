# EC2 INSTANCE ARGUMENT VALUES
ami_values                  = ["jenkins_master_ami"]
instance_type               = "t2.medium"
key_name                    = "lennips_laptop"
server_name                 = ["jenkins_tool"]
role                        = "jenkins_tool"
environment                 = "jenkins_tool_dev"
name_list_index             = 1
name                        = ""
server_amis                 = ""
#user_data                   = ""

# SECURITY GROUP ARGUMENT VALUES
from_port = "22"
to_port   = "22"

from_port2 = ["8080"]
to_port2 = ["8080"]

protocol  = "tcp"

# SUBNET ARGUMENT VALUES
public_subnet_cidr_block = ["40.0.40.0/24"]
availability_zone_marker   = ["d"]

# BACKEND ARGUMENT VALUE
backend_key = ["dir-app/jenkins/terraform.tfstate"]

# AWS ARGUMENT VALUE
region = "us-east-1"