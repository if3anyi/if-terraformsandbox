provider "aws" {
  region                  = "eu-west-1"
  shared_credentials_file = "/Users/ofobodw6/.aws/credentials"
  profile                 = "webops"
}

module "webserver_cluster" {
  source = "../../../../../loops-and-if-statements/modules/services/webserver-cluster"
  #source = "git@github.com:brikis98/terraform-up-and-running-code.git//code/terraform/04-terraform-module/module-example/modules/services/webserver-cluster?ref=v0.0.1"
  #source = "git::git@github.com:if3anyi/if-terraformsandbox-modules.git//services/webserver-cluster?ref=v0.0.1"

  cluster_name = "loops-webservers-prod"
  bucket_name = "loops-example-a"

  instance_type = "m4.large"
  min_size = "2"
  max_size = "10"
  #turns on/off scaling
  enable_autoscaling   = false
}
