resource "aws_vpc" "mainVPC" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "mainVPC"
  }
}
resource "aws_subnet" "publicSubnet-1" {
  cidr_block = "10.0.1.0/24"
  vpc_id     = aws_vpc.mainVPC.id
  tags = {
    Name = "publicSubnet-1"
  }
}
resource "aws_subnet" "privateSubnet-1" {
  cidr_block = "10.0.2.0/24"
  vpc_id     = aws_vpc.mainVPC.id
  tags = {
    Name = "privateSubnet-1"
  }
}
resource "aws_subnet" "privateSubnet-2" {
  cidr_block = "10.0.3.0/24"
  vpc_id     = aws_vpc.mainVPC.id
  tags = {
    Name = "privateSubnet-2"
  }
}
resource "aws_internet_gateway" "myIGW" {
  vpc_id = aws_vpc.mainVPC.id
}

resource "aws_nat_gateway" "my_nat" {
  allocation_id = aws_eip.my_eip.id
  subnet_id     = aws_subnet.publicSubnet-1.id

  tags = {
    Name = "MyNatGateway"
  }
}

resource "aws_eip" "my_eip" {
  vpc = true
}
