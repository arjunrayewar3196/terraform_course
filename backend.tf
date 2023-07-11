terraform {
  backend "s3" {
    bucket = "myterraformbucketarjun"
    key    = "terraform.tfstate"
    region = "us-east-2"
  }
}
