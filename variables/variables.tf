variable "AWS_ACCESS_KEY" {}

variable "AWS_SECRET_KEY" {}

variable "AWS_REGION" {
  default = "us-west-1"
}

variable "Security_Group" {
  type    = "list"
  default = ["sg-24076", "sg-90890", "sg-456789"]
}

variable "AMIS" {
  type = "map"
  default = {
    us-west-1 = "ami-0bccc62e3597f7e20"
    us-west-2 = "ami-073135209fa195278"
    us-east-1 = "ami-03e9bdcf7102a90ba"
    us-east-2 = "ami-0290315e6235b4c90"
  }
}
