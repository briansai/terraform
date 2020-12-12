#Define External IP
resource "aws_eip" "custom-nat" {
  vpc = true
}

resource "aws_nat_gateway" "custom-nat-gw" {
  allocation_id = aws_eip.custom-nat.id
  subnet_id = aws_subnet.custom-vpc-public-1.id
  depends_on = [aws_internet_gateway.internet-gw]
}

resource "aws_route_table" "custom-private" {
  vpc_id = aws_vpc.custom-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.custom-nat-gw.id
  }

  tags = {
    Name = "custom-private"
  }
}

resource "aws_route_table_association" "custom-private-1" {
  subnet_id = aws_subnet.custom-vpc-private-1.id
  route_table_id = aws_route_table.custom-private.id
}

resource "aws_route_table_association" "custom-private-2" {
  subnet_id = aws_subnet.custom-vpc-private-2.id
  route_table_id = aws_route_table.custom-private.id
}