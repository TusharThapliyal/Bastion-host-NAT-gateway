output "public_instance_public_ip" {
  description = "this is the public ip of bastion host"
  value       = module.instance.public_instance_ip
}
output "private_instance_public_ip" {
  description = "this is the private ip of private_instance"
  value       = module.instance.private_instance_ip
}
