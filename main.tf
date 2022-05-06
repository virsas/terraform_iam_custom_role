provider "aws" {
  region = var.region
}

resource "aws_iam_policy" "policy" {
  name = var.name
  policy = file("json/iam_policies/${var.name}.json")
}

resource "aws_iam_role" "role" {
  name                = var.name
  assume_role_policy  = file("json/iam_roles/${var.name}.json")
  managed_policy_arns = [aws_iam_policy.policy.arn]
}

resource "aws_iam_instance_profile" "profile" {
  name = var.name
  role = aws_iam_role.role.name
}