module "network" {
  source = "./network"
}
module "instance" {
  source                 = "./instance"
  publicSubnetId         = module.network.publicSubnetId
  ubuntuAmiID            = module.ami.ubuntuAmiID
  publicSecurityGroupId  = module.securityGroup.publicSecurityGroupId
  key_id                 = module.keyPair.key_id
  privateSubnetId        = module.network.privateSubnetId
  privateSecurityGroupId = module.securityGroup.privateSecurityGroupId
}
module "securityGroup" {
  source             = "./securityGroup"
  vpcId              = module.network.vpcId
  public_instance_ip = module.instance.public_instance_ip
}
module "routeTable" {
  source          = "./routeTable"
  vpcId           = module.network.vpcId
  igwID           = module.network.igwID
  publicSubnetId  = module.network.publicSubnetId
  my_nat_id       = module.network.my_nat_id
  privateSubnetId = module.network.privateSubnetId
}
module "ami" {
  source = "./ami"
}
module "keyPair" {
  source = "./keyPair"
}
