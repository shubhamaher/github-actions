provider "aws" {
  region = "eu-west-2"
}

resource "aws_instance" "web_server" {
  ami           = "ami-0a94c8e4ca2674d5a" # Ubuntu 22.04 LTS
  instance_type = "t2.micro"
  key_name = "devops_key"
  
  tags = {
    Name = "GitHub-Actions-EC2"
  }
}

output "public_ip" {
  value = aws_instance.web_server.public_ip
}
