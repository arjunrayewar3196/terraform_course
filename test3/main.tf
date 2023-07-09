provider "aws" {
  region     = "us-east-2"
  access_key = ""
  secret_key = ""
}

resource "aws_instance" "ec2_example" {

   ami           = "ami-069d73f3235b535bd"
   instance_type =  var.instance_type

   tags = {
           Name = var.environement_name
   }
}
