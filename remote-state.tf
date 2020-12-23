terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "alerodrigueslabs"

    workspaces {
      name = "aws-alerodrigueslabs"
    }
  }
}