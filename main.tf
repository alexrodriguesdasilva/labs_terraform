provider "aws" {
  version = "~> 2.0"
  region = "us-east-1"
}

provider "aws" {
  alias = "us-east-2"
  version = "~> 2.0"
  region = "us-east-2"
}

resource "aws_instance" "dev" {
  count = 3
  ami = "${var.amis["us-east-1"]}"
  instance_type = "${var.instance_type["tipo"]}"
  key_name = "${var.key_name}"
  tags = {
      Name = "dev${count.index}"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
  subnet_id = "subnet-0b38d89493d213e5a"
}

resource "aws_instance" "dev4" {
  ami = "${var.amis["us-east-1"]}"
  instance_type = "${var.instance_type["tipo"]}"
  key_name = "${var.key_name}"
  tags = {
      Name = "dev4"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
  depends_on = [aws_s3_bucket.dev4]
  subnet_id = "subnet-0b38d89493d213e5a"
}

resource "aws_instance" "dev5" {
  ami = "${var.amis["us-east-1"]}"
  instance_type = "${var.instance_type["tipo"]}"
  key_name = "${var.key_name}"
  tags = {
      Name = "dev5"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
  subnet_id = "subnet-0b38d89493d213e5a"
}

resource "aws_instance" "dev6" {
  provider = "aws.us-east-2"
  ami = "${var.amis["us-east-2"]}"
  instance_type = "${var.instance_type["tipo"]}"
  key_name = "${var.key_name}"
  tags = {
      Name = "dev6"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh-us-east-2.id}"]
  depends_on = ["aws_dynamodb_table.dynamodb-homologacao"]
  #subnet_id = "subnet-0b38d89493d213e5a"
}

resource "aws_instance" "dev7" {
  provider = "aws.us-east-2"
  ami = "${var.amis["us-east-2"]}"
  instance_type = "${var.instance_type["tipo"]}"
  key_name = "${var.key_name}"
  tags = {
      Name = "dev7"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh-us-east-2.id}"]
  #subnet_id = "subnet-0b38d89493d213e5a"
}

resource "aws_s3_bucket" "dev4" {
  bucket = "alerodrigueslabs-dev4"  
  acl = "private"

  tags ={
    Name = "alerodrigueslabs-dev4" 
  }
}

resource "aws_dynamodb_table" "dynamodb-homologacao" {
  provider = "aws.us-east-2"
  name = "GameScores"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "UserId"
  range_key = "GameTitle"

  attribute {
    name = "UserId"
    type = "S"
  }

  attribute {
    name = "GameTitle"
    type = "S"
  }
}