provider "aws" {
  access_key = "AKIA4ALR4DLJKFLPIMGM"
  secret_key = "SECRET_KEY"
  region     = "us-west-1"
}

resource "aws_instance" "MyFirstInstance" {
  ami           = "ami-0bce08e823ed38bdd"
  instance_type = "t2.micro"
}
