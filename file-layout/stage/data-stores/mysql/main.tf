provider "aws" {
  region                  = "eu-west-1"
  shared_credentials_file = "/Users/ofobodw6/.aws/credentials"
  profile                 = "webops"
}

resource "aws_db_instance" "example" {
  engine              = "mysql"
  allocated_storage   = 10
  instance_class      = "db.t2.micro"
  name                = "example_database"
  username            = "admin"
  password            = "${var.db_password}"
  identifier          = "snbx-rds-book"
  skip_final_snapshot = true
}
