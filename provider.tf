terraform {
  required_version = "~>1.7.0"
}
provider "aws" {
  region = var.primaryRegion
}
provider "aws" {
  alias  = "west"
  region = var.secendoryRegion
}
