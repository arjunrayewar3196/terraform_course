provider "aws" {
  region     = "us-east-2"
  access_key = "AKIA5V6HK7ILRGKFN6WK"
  secret_key = "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"
}


resource "aws_instance" "webserver" {
  ami           = "ami-069d73f3235b535bd"
  instance_type = var.instance_type

  tags = {
    Name = "server1"
  }
}

