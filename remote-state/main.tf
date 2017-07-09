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
