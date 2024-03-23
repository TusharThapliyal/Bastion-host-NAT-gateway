resource "aws_instance" "publicInstance" {
  associate_public_ip_address = true
  subnet_id                   = var.publicSubnetId
  instance_type               = "t2.micro"
  ami                         = var.ubuntuAmiID
  vpc_security_group_ids      = [var.publicSecurityGroupId]

  key_name = var.key_id
  tags = {
    Name = "bastion-host"
  }
}
resource "aws_instance" "private_instance" {
  subnet_id              = var.privateSubnetId
  instance_type          = "t2.micro"
  ami                    = var.ubuntuAmiID
  vpc_security_group_ids = [var.privateSecurityGroupId]
  key_name               = var.key_id

  tags = {
    Name = "ubuntu-server"
  }
}
