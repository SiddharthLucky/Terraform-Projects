provider "aws" {
  alias = "Terraform-2"
  region     = var.accounts["account1"].region
  access_key = var.accounts["account1"].access_key
  secret_key = var.accounts["account1"].secret_key
}

provider "aws" {
  alias      = "Terraform-3"
  region     = var.accounts["account2"].region
  access_key = var.accounts["account2"].access_key
  secret_key = var.accounts["account2"].secret_key
}

locals {
  users = {
    "user1" = "Terraform-2"
    "user2" = "Terraform-3"
  }
}