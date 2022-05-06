# terraform_iam_custom_role

Terraform module to create IAM Role with custom policy

##  Dependencies

None

## Files

- IAM policies: path ./json/iam_policies/ec2.json

``` json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents",
        "logs:DescribeLogStreams"
      ],
      "Resource": [
        "arn:aws:logs:*:*:*"
      ]
    }
  ]
}
```

- Role policies: path ./json/iam_roles/ec2.json

``` json
{
 "Version": "2012-10-17",
 "Statement": [
   {
      "Effect": "Allow",
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      }
    }
  ]
}
```
the json file has the same name as the role

## Terraform example

``` terraform
##############
# Variable
##############
# Not needed

##############
# Module
##############
module "iam_role_ec2" {
  source = "github.com/virsas/terraform_iam_custom_role"
  name = "ec2"
}
```
