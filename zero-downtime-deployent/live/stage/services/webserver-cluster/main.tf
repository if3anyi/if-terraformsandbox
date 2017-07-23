provider "aws" {
  region                  = "eu-west-1"
  shared_credentials_file = "/Users/ofobodw6/.aws/credentials"
  profile                 = "webops"
}

module "webserver_cluster" {
  source = "../../../../../zero-downtime-deployent/modules/services/webserver-cluster"

  ami         = "ami-d7b9a2b1"
  server_text = "bambam"
  bucket_name = "downtime-ws-stage"

  cluster_name           = "downtime-ws-stage"
  # db_remote_state_bucket = "${var.db_remote_state_bucket}"
  # db_remote_state_key    = "${var.db_remote_state_key}"

  instance_type      = "t2.micro"
  min_size           = 2
  max_size           = 2
  enable_autoscaling = false
}

resource "aws_security_group_rule" "allow_testing_inbound" {
  type              = "ingress"
  security_group_id = "${module.webserver_cluster.elb_security_group_id}"

  from_port   = 12345
  to_port     = 12345
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}