terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1" # Change to your preferred AWS region
}

# 1. Create the IAM Group
resource "aws_iam_group" "developers" {
  name = "Developers"
}

# 2. Create the IAM User
resource "aws_iam_user" "new_user" {
  name = "john.doe" # Change to your desired username
}

# 3. Add the User to the IAM Group
resource "aws_iam_user_group_membership" "user_membership" {
  user = aws_iam_user.new_user.name
  groups = [
    aws_iam_group.developers.name
  ]
}
