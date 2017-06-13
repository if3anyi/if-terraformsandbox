provider "aws" {
  region                  = "eu-west-1"
  shared_credentials_file = "/Users/ofobodw6/.aws/credentials"
  profile                 = "webops"
}

resource "aws_instance" "example" {
  ami           = "ami-01ccc867"
  instance_type = "t2.micro"

  tags {
    Name = "sandbox-onewebserver"
  }
}
