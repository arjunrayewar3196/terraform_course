terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}


provider "aws" {
  region     = "us-east-2"
  access_key = ""
  secret_key = ""
}


module "dev_vpc" {
 source         = "../modules/vpc"
 vpc_cidr       = "20.0.0.0/16"
 tenancy        = "default"
 vpc_id         = "${module.dev_vpc.vpc_id}"
 subnet_cidr    = "20.0.1.0/24"
}

module "dev_ec2" {
 source         = "../modules/ec2"
 ami_id         = "ami-069d73f3235b535bd"
 subnet_id      = "${module.dev_vpc.subnet_id}"
}
