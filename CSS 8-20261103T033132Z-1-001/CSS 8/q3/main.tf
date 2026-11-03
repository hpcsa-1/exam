terraform {
	required_providers {
		aws = {
			source = "hashicorp/aws"
			version = "~> 5.0"
		}
	}
}

provider "aws" {
	region = "us-east-1"
}

resource "aws_iam_user" "s3_reader" {
	name = "s3-readonly-user"
	path = "/"
	
	tags = {
		Environment = "Development"
	}
}

resource "aws_iam_user_policy_attachment" "s3_read_only_attachment" {
	user = aws_iam_user.s3_reader.name
	policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}
