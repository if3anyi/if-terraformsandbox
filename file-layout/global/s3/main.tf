provider "aws" {
  region                  = "eu-west-1"
  shared_credentials_file = "/Users/ofobodw6/.aws/credentials"
  profile                 = "webops"
}


resource "aws_s3_bucket" "terraform_state" {
  bucket = "${var.bucket_name}"

  versioning {
    enabled = true
  }

  lifecycle {
   prevent_destroy = false
  }
}

# terraform {
#   backend "s3" {
#     bucket = "snbx-terraform-up-and-running"
#     key    = "terraform.tfstate"
#     region = "eu-west-1"
#   }
# }

# UTILIZING BACKENDS WITH S3 BUCKETS. Working in progress
# data "terraform_remote_state" "remote" {
#   backend = "s3"
#   config {
#     bucket = "snbx-terraform-up-and-running-filelayout"
#     key    = "terraform.tfstate"
#     region = "eu-west-1"
#   }
# }
