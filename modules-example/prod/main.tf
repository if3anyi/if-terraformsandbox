provider "aws" {
  region                  = "eu-west-2"
  shared_credentials_file = "/Users/ofobodw6/.aws/credentials"
  profile                 = "webops"
}

module "webserver-cluster" {
  source = "../../../modules/services/webserver-cluster"
}
