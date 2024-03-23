output "publicSubnetId" {
  value = aws_subnet.publicSubnet-1.id
}
output "privateSubnetId" {
  value = aws_subnet.privateSubnet-1.id
}
output "vpcId" {
  value = aws_vpc.mainVPC.id
}
output "igwID" {
  value = aws_internet_gateway.myIGW.id
}
output "my_nat_id" {
  value = aws_nat_gateway.my_nat.id
}
