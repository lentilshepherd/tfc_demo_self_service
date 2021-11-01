variable "aws_region" {
  description = "AWS region"
  default     = "eu-west-2"
}

variable "ami_id" {
  description = "ID of the AMI to provision. Default is Ubuntu 14.04 Base Image"
  default     = "ami-02c7ed3df628d7ba2"
}
