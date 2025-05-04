provider "aws" {
  region = "eu-west-2a"
}

resource "aws_instance" "web_server" {
  ami           = "ami-0c55b159cbfafe1f0" # Ubuntu 22.04 LTS
  instance_type = "t2.micro"
  key_name = "devops_key"
  
  tags = {
    Name = "GitHub-Actions-EC2"
  }
}

output "public_ip" {
  value = aws_instance.web_server.public_ip
}
