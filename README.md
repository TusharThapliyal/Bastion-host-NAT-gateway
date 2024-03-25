# Bastion host and NAT-gateway

Connecting our resources in AWS private subnet using Bastion-host and NAT-gateway. This repo contains Terraform code to deploy a NAT-gateway to allow private instance access to internet and a Bastion host in public subnet which can be used to ssh into our instance in private subnet. 

## Use case

A ``Bastion host``, also known as a jump host, is a server that sits in a public subnet and acts as a gateway to access servers in private subnets securely. You SSH into the bastion host first, and then from there, you can SSH into other servers in private subnets. This limits direct access to servers in private subnets from the internet, improving security.\
A ``NAT gateway`` enables instances in a private subnet to initiate outbound traffic to the internet while preventing inbound traffic from initiating a connection with those instances. Instances in private subnets can use the NAT gateway to access the internet for software updates, fetching dependencies, etc., without exposing their private IP addresses to the internet.

## Modules used
1. ``ami`` : contains ubuntu ami data source to fetch latest ami id depending on the region used.
2. ``instance`` : deploys two ec2 instance. one Bastion host in public subnet and one instance in private subnet.
3. ``keyPair`` : fetch SSH key from **~/.ssh** on our local machine.
4. ``network`` : deploys VPC + public subnet + private subnet + internet gateway + NAT gateway + elastic ip.
5. ``routeTable`` : deploys public route table (allowing route to igw) + private route table.
6. ``securityGroup`` : deploys public security group + private security group. Ingress rules of private security group should only allow ssh from our public security group.

## Installation
1. initialize terraform directory and download necessary plugins
```terraform
terraform init
```
2. create a plan and save it as a file "plane-1"
```terraform
terraform plan -out plan-1
```
3. apply plan "plan-1"
```terraform
terraform apply plan-1
```

## File provisioner

Our Bastion host needs SSH key to SSH into our instance in private subnet. We can use file provisioner to send SSH key from our local machine to Bastion host.
```bash
connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("~/.ssh/jenkins-demo")
    host        = self.public_ip
  }
 provisioner "file" {
    source      = "~/.ssh/jenkins-demo"
    destination = "~/.ssh/jenkins-demo"
  }
```

## Security best practices
1. Your security group for private instance should only allow ssh connection coming from  your public security group.
2. You can improve security by only allowing traffic from your local machine
 to public security group.
