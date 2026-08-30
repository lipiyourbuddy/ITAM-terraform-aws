terraform {
  backend "s3" {
    bucket  = "itam-terraform-state-lipika"
    key     = "itam/terraform.tfstate"
    region  = "us-east-1"
    profile = "itam-terraform"
    encrypt = true
  }
}