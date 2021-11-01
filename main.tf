terraform {
  required_version = ">= 0.12.0"
}

provider "aws" {
  region = var.aws_region
}

# Non-compliant config
module "tfc-demo-bad-two-tier" {
  source  = "app.terraform.io/Gritstone/tfc-demo-two-tier/aws"
  version = "1.0.3"

  # ubuntu-bionic
  aws_ami = "ami-008485ca60c91a0f3"
  service_name = "bad-two-tier"
}

# resource "aws_instance" "ubuntu" {
#   # ubuntu bionic
#   ami               = "ami-008485ca60c91a0f3"
#   instance_type     = "t2.micro"
#   availability_zone = "eu-west-2a"

#   tags = {
#     Name = "non-compliant"
#   }
# }

# Compliant config
module "tfc-demo-good-two-tier" {
  source  = "app.terraform.io/Gritstone/tfc-demo-two-tier/aws"
  version = "1.0.3"
  aws_ami = "ami-02c7ed3df628d7ba2"
  service_name = "good-two-tier"
}