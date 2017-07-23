provider "aws" {
  region                  = "eu-west-1"
  shared_credentials_file = "/Users/ofobodw6/.aws/credentials"
  profile                 = "webops"
}

# Creates 3 different users
resource "aws_iam_user" "example" {
  # count = 3
  # name = "neo.${count.index}"
  count = "${length(var.user_names)}"
  name = "${element(var.user_names, count.index)}"
}

# JSON Policy
data "aws_iam_policy_document" "ec2_read_only" {
  statement {
    effect    = "Allow"
    actions   = ["ec2:Describe*"]
    resources = ["*"]
  }
}

# Policy Created & Policy Added to it.
resource "aws_iam_policy" "ec2_read_only" {
  name   = "development-ec2-only-access"
  policy = "${data.aws_iam_policy_document.ec2_read_only.json}"
}

#Add that policy to the users created.
resource "aws_iam_user_policy_attachment" "ec2_access" {
  count      = "${length(var.user_names)}"
  user       = "${element(aws_iam_user.example.*.name, count.index)}"
  policy_arn = "${aws_iam_policy.ec2_read_only.arn}"
}
