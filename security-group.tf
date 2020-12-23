resource "aws_security_group" "acesso-ssh" {
  name = "acesso-ssh"
  description = "acesso-ssh"
  vpc_id      = "vpc-0bf7ff9f7c61d6803"
  
  ingress {
  from_port = 22
  to_port = 22  
  protocol =  "tcp"
  
  cidr_blocks = var.cdris_acesso_remoto
  }

  tags = {
    Name = "ssh"
  }
}

resource "aws_security_group" "acesso-ssh-us-east-2" {
  provider = "aws.us-east-2"
  name = "acesso-ssh"
  description = "acesso-ssh"
  #vpc_id      = "vpc-0bf7ff9f7c61d6803"
  
  ingress {
  from_port = 22
  to_port = 22  
  protocol =  "tcp"
  
  cidr_blocks = var.cdris_acesso_remoto
  }

  tags = {
    Name = "ssh"
  }
}