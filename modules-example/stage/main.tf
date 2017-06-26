provider "aws" {
  region                  = "eu-west-1"
  shared_credentials_file = "/Users/ofobodw6/.aws/credentials"
  profile                 = "webops"
}

module "webserver-cluster" {
  source = "../../modules-examples/modules/services/webserver-cluster"
}
