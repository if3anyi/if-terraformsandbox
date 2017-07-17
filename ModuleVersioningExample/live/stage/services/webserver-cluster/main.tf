provider "aws" {
  region                  = "eu-west-1"
  shared_credentials_file = "/Users/ofobodw6/.aws/credentials"
  profile                 = "webops"
}

module "webserver_cluster" {
  #source = "../../../../ModuleVersioningExample/modules/services/webserver-cluster"
  #source = "git::git@github.com:foo/modules.git//webserver-cluster?ref=v0.0.1"
  #source = "git::git@github.com:if3anyi/if-terraformsandbox-modules.git//services/webserver-cluster?ref=v0.0.1"
  source = "git::git@github.com:if3anyi/if-terraformsandbox-modules.git//services/webserver-cluster?ref=v0.0.2"

  cluster_name = "webservers-stage"
  bucket_name = "ModuleVersion-example-a"

  instance_type = "t2.micro"
  min_size = "2"
  max_size = "3"
}

#example that helps you add you own custom rule without breaking module
resource "aws_security_group_rule" "allow_testing_inbound" {
  type = "ingress"
  security_group_id = "${module.webserver_cluster.elb_security_group_id}"

  from_port  = 12345
  to_port    = 12345
  protocol   = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}
