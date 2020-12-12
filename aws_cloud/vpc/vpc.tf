#Create AWS VPC
resource "aws_vpc" "custom-vpc" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"

  tags = {
    Name = "custom-vpc"
  }
}

#Public Subnets
resource "aws_subnet" "custom-vpc-public-1" {
  vpc_id                  = aws_vpc.custom-vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-west-1a"

  tags = {
    Name = "custom-vpc-public-1"
  }
}

resource "aws_subnet" "custom-vpc-public-2" {
  vpc_id                  = aws_vpc.custom-vpc.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-west-1c"

  tags = {
    Name = "custom-vpc-public-2"
  }
}

#Private Subnets
resource "aws_subnet" "custom-vpc-private-1" {
  vpc_id                  = aws_vpc.custom-vpc.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "us-west-1a"

  tags = {
    Name = "custom-vpc-private-1"
  }
}

resource "aws_subnet" "custom-vpc-private-2" {
  vpc_id                  = aws_vpc.custom-vpc.id
  cidr_block              = "10.0.4.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "us-west-1c"

  tags = {
    Name = "custom-vpc-private-2"
  }
}

#Custom Internet Gateway
resource "aws_internet_gateway" "internet-gw" {
  vpc_id = aws_vpc.custom-vpc.id

  tags = {
    Name = "internet-gw"
  }
}

#Routing Table for the Custom VPC
resource "aws_route_table" "custom-public" {
  vpc_id = aws_vpc.custom-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-gw.id
  }

  tags = {
    Name = "custom-public"
  }
}

resource "aws_route_table_association" "custom-vpc-public-1" {
  subnet_id      = aws_subnet.custom-vpc-public-1.id
  route_table_id = aws_route_table.custom-public.id
}

resource "aws_route_table_association" "custom-vpc-public-2" {
  subnet_id      = aws_subnet.custom-vpc-public-2.id
  route_table_id = aws_route_table.custom-public.id
}