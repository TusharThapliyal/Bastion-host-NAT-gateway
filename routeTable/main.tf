resource "aws_route_table" "public_subnet_rt" {
  vpc_id = var.vpcId
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igwID
  }
}
resource "aws_route_table_association" "connect_to_public_subnet" {
  route_table_id = aws_route_table.public_subnet_rt.id
  subnet_id      = var.publicSubnetId
}


resource "aws_route_table" "private_subnet_rt" {
  vpc_id = var.vpcId
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.my_nat_id
  }
}
resource "aws_route_table_association" "connect_to_private_subnet" {
  route_table_id = aws_route_table.private_subnet_rt.id
  subnet_id      = var.privateSubnetId
}
