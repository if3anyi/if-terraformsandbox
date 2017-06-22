provider "aws" {
  region                  = "eu-west-1"
  shared_credentials_file = "/Users/ofobodw6/.aws/credentials"
  profile                 = "webops"
}

resource "aws_instance" "snbx-onewebserver-with-vars" {
  ami                    = "ami-a8d2d7ce"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.snbx-onewebserver-with-vars.id}"]

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, Dennis" > index.html
              nohup busybox httpd -f -p "${var.server_port}" &
              EOF

  tags {
    Name = "snbx-onewebserver-with-vars"
  }
}

resource "aws_security_group" "snbx-onewebserver-with-vars" {
  name = "terraform-example-instance"

  ingress {
    from_port   = "${var.server_port}"
    to_port     = "${var.server_port}"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "public_ip" {
  value = "${aws_instance.snbx-onewebserver-with-vars.public_ip}"
}

output "vpc_id" {
  value = "${aws_security_group.snbx-onewebserver-with-vars.vpc_id}"
}
