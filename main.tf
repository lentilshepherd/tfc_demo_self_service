terraform {
  required_version = ">= 0.12.0"
}

provider "aws" {
  region = var.aws_region
}

module "tfc-demo-two-tier" {
  source  = "app.terraform.io/Gritstone/tfc-demo-two-tier/aws"
  version = "1.0.3"
  aws_region = "eu-west-2"
  aws_ami = "ami-02c7ed3df628d7ba2"
}