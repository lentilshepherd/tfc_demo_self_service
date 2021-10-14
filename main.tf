terraform {
  required_version = ">= 0.12.0"
}

provider "aws" {
  region = var.aws_region
}

module "ec2-instance" {
  source  = "app.terraform.io/gritstone/ec2-instance/aws"
  version = "3.2.0"

  ami               = var.ami_id
  instance_type     = var.instance_type
  availability_zone = "${var.aws_region}a"

  tags = {
    Name = var.name
  }  
}