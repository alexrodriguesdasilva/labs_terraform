provider "aws" {
  version = "~> 2.0"
  region = "us-east-1"
}

resource "aws_instance" "dev" {
  count = 3
  ami = "ami-00ddb0e5626798373"
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  tags = {
      Name = "dev${count.index}"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
  subnet_id = "subnet-0b38d89493d213e5a"
}

resource "aws_security_group" "acesso-ssh" {
  name = "acesso-ssh"
  description = "acesso-ssh"
  vpc_id      = "vpc-0bf7ff9f7c61d6803"
  
  ingress {
  from_port = 22
  to_port = 22  
  protocol =  "tcp"
  
  cidr_blocks = ["200.221.157.12/32"]
  }

  tags = {
    Name = "ssh"
  }
}