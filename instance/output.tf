output "public_instance_ip" {
  value = aws_instance.publicInstance.public_ip
}
output "private_instance_ip" {
  value = aws_instance.private_instance.private_ip
}
