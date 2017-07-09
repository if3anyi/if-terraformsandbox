# output "asg_name" {
#   value = "${aws_autoscaling_group.example.name}"
# }

output "elb_dns_name" {
  value = "${module.webserver_cluster.elb_dns_name}"
}
