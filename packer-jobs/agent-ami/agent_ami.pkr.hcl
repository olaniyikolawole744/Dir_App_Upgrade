variable "access_key" {
  type      = string
  default   = "${env("AWS_ACCESS_KEY")}"
  sensitive = true
}

variable "secret_key" {
  type      = string
  default   = "${env("AWS_SECRET_ACCESS_KEY")}"
  sensitive = true
}

variable "region" {
  type      = string
  default   = "us-east-1"
  sensitive = true
}

source "amazon-ebs" "agent_ami" {
  tags = {
    Name = "agent_ami"
  }
  access_key    = "${var.access_key}"
  secret_key    = "${var.secret_key}"
  region        = "${var.region}"
  ssh_username  = "ec2-user"
  ami_name      = "agent_ami"
  source_ami    = "ami-02e136e904f3da870"
  instance_type = "t2.micro"
}

build {
  sources = ["source.amazon-ebs.agent_ami"]

  provisioner "file" {
    source      = "tf-packer.pub"
    destination = "/tmp/"
  }

  provisioner "shell" {
    script = "create-jenkins-agent-user.sh"
  }

  provisioner "shell" {
    script = "create-ansible-agent-user.sh"
  }

  provisioner "shell" {
    script = "install-agent-dependency.sh"
  }

  provisioner "shell" {
    script = "install-agent-pkgs.sh"
  }
}