resource "aws_instance" "MyFirstInstance" {
  count         = 3
  ami           = "ami-055a0e87092ed2ba4"
  instance_type = "t2.micro"

  tags = {
    Name = "demoinstance-${count.index}"
  }
}
