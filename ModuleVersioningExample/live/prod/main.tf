provider "aws" {
  region                  = "eu-west-1"
  shared_credentials_file = "/Users/ofobodw6/.aws/credentials"
  profile                 = "webops"
}

module "webserver_cluster" {
  source = "../../../ModuleVersioningExample/modules/services/webserver-cluster"

  cluster_name = "webservers-production"
  bucket_name = "ModuleVersion-example-b"

  instance_type = "m4.large"
  min_size = "2"
  max_size = "10"
}

resource "aws_autoscaling_schedule" "scale_out_during_business_hours" {
  scheduled_action_name = "scale_out_during_business_hours"
  min_size = "2"
  max_size = "10"
  desired_capacity = "10"
  recurrence = "0 9 * * *"

  autoscaling_group_name = "${module.webserver_cluster.asg_name}"
}

resource "aws_autoscaling_schedule" "scale_in_at_night" {
  scheduled_action_name = "scale_in_at_night"
  min_size = "2"
  max_size = "10"
  desired_capacity = "2"
  recurrence = "0 17 * * *"
  autoscaling_group_name = "${module.webserver_cluster.asg_name}"
}
