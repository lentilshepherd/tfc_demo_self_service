terraform {
  required_version = ">= 0.12.0"
}

provider "aws" {
  region = var.aws_region
}


# Compliant config
module "tfc-demo-good-two-tier" {
  source  = "app.terraform.io/Gritstone/tfc-demo-two-tier/aws"
  version = "1.0.4"
  aws_ami = "ami-02c7ed3df628d7ba2"
  service_name = "compliant-two-tier"
}
