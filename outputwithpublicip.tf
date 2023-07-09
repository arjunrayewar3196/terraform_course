instanceip = "10.5.21.227"
instanceippublic = "3.142.51.65"
root@ip-172-31-34-159:~/terraform_course/test4# cat main.tf
provider "aws" {
  region     = "us-east-2"
  access_key = ""
  secret_key = ""
}

locals {
  env_name = "staging"
}

resource "aws_vpc" "staging-vpc" {
  cidr_block = "10.5.0.0/16"

  tags = {
    Name = "${local.env_name}-vpc-tag"
  }
}

resource "aws_subnet" "staging-subnet" {
  vpc_id     = aws_vpc.staging-vpc.id
  cidr_block = "10.5.0.0/16"

  tags = {
    Name = "${local.env_name}-subnet-tag"
  }
}

resource "aws_instance" "ec2_example" {

  ami           = "ami-069d73f3235b535bd"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.staging-subnet.id
  associate_public_ip_address = true
  tags = {
    Name = "${local.env_name} - Terraform EC2"
  }
}

output "instanceip" {
  value = aws_instance.ec2_example.private_ip
}



output "instanceippublic" {
  value = 
