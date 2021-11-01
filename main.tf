terraform {
  required_version = ">= 0.12.0"
}

provider "aws" {
  region = var.aws_region
}

# Non-compliant config - Resource created from root module
resource "aws_instance" "bad_ubuntu" {
  # ubuntu bionic 
  ami               = "ami-008485ca60c91a0f3"
  instance_type     = "t2.micro"
  availability_zone = "eu-west-2a"

  tags = {
    Name = "non-compliant"
  }
}

# Non-compliant config - Using module from public registry
module "bad_ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "tfc-demo-public-ec2-module"

  ami                    = "ami-02c7ed3df628d7ba2"
  instance_type          = "t2.micro"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

# Compliant config
module "tfc-demo-good-two-tier" {
  source       = "app.terraform.io/Gritstone/tfc-demo-two-tier/aws"
  version      = "1.0.4"
  aws_ami      = "ami-02c7ed3df628d7ba2"
  service_name = "compliant-two-tier"
}
