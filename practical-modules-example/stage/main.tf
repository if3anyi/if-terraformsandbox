provider "aws" {
  region                  = "eu-west-1"
  shared_credentials_file = "/Users/ofobodw6/.aws/credentials"
  profile                 = "webops"
}

module "webserver_cluster" {
  source = "../../practical-modules-example/modules/services/webserver-cluster"

  cluster_name = "webservers-stage"
  bucket_name = "example-a"

  instance_type = "t2.micro"
  min_size = "2"
  max_size = "3"
}


resource "aws_security_group_rule" "allow_testing_inbound" {
  type = "ingress"
  security_group_id = "${module.webserver_cluster.elb_security_group_id}"

  from_port  = 12345
  to_port    = 12345
  protocol   = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}
