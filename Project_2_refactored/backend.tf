terraform {
  backend "s3" {
    bucket = "tf-backend-a29e0b1b37791449"
    region = "us-east-1"
    key = "TFKey/terraform.tfstate"
  }
}