provider "aws" {
  region = "ap-south-1"
}
terraform {
  backend "s3" {
    bucket         = "kunal-terraform-state-12345"
    key            = "multi-tier/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-lock"
  }
}