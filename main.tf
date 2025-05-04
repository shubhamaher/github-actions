terraform {
  backend "remote" {
    organization = "creonextech"
    workspaces {
      name = "github-actions"
    }
  }
}

provider "aws" {
  region = "eu-west-2"
}

# Data source to find instances with the same Name tag
data "aws_instances" "named" {
  filter {
    name   = "tag:Name"
    values = ["GitHub-Actions-EC2"]
  }
}

# Data source to get all EC2 instances
data "aws_instances" "all" {}

resource "aws_instance" "web_server" {
  ami           = "ami-0a94c8e4ca2674d5a" # Ubuntu 22.04 LTS
  instance_type = "t2.micro"
  key_name      = "devops_key"
  tags = {
    Name = "GitHub-Actions-EC2"
  }
}

output "public_ip" {
  value = aws_instance.web_server.public_ip
}

output "existing_named_instance_ids" {
  value = data.aws_instances.named.ids
}

output "all_instance_ids" {
  value = data.aws_instances.all.ids
}
