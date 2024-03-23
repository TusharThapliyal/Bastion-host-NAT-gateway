output "publicSecurityGroupId" {
  value = aws_security_group.publicSG.id
}
output "privateSecurityGroupId" {
  value = aws_security_group.private_sg.id
}
