terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = var.vpc_region
}

resource "aws_vpc" "exp_vpc" {
  cidr_block       = var.vpc_cidr_block
  enable_dns_hostnames = true
  
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_internet_gateway" "vpc_igw" {
  vpc_id = aws_vpc.exp_vpc.id

  tags = {
    Name = "vpc_igw"
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.exp_vpc.id

  route  {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.vpc_igw.id
      }
  
  tags = {
    Name = "public_route_table"
  }
}


/*
# CREATE IAM ROLE
resource "aws_iam_role_policy" "ec2_policy" {
  name = "ec2_policy"
  role = aws_iam_role.test_role.id

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        
            "Action": "ec2:*",
            "Effect": "Allow",
            "Resource": "*"

        
      },
      {
        
            "Action": "iam:*",
            "Effect": "Allow",
            "Resource": "*"

        
      },
    ]
  })
}

resource "aws_iam_role" "test_role" {
  name = "dir_app_master_ec2_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_instance_profile" "test_profile" {
  name =  "dir_app_master_ec2_profile"
  role = aws_iam_role.test_role.name
  }

*/

