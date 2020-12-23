variable "amis" {
  type = "map"

  default = {
      "us-east-1" = "ami-00ddb0e5626798373"
      "us-east-2" = "ami-0dd9f0e7df0f0a138"
  }
}

variable "cdris_acesso_remoto" {
    type = "list"
    default = ["200.221.157.12/32","210.221.157.12/32"]
}

variable "instance_type" {
    type = "map"

    default = {
        "tipo" = "t2.micro"
    }
}

variable "key_name" {
    default = "terraform-aws"
}