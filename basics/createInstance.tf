provider "aws" {
  access_key = "AKIA4ALR4DLJKFLPIMGM"
  secret_key = "SECRET_KEY"
  region     = "us-west-1"
}

resource "aws_instance" "MyFirstInstance" {
  ami           = "ami-055a0e87092ed2ba4"
  instance_type = "t2.micro"
}
