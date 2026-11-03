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

resource "aws_s3_bucket" "cssaq2_bucket" {
	bucket = "smit-bucket-02112003"
}

#added block to upload file 
resource "aws_s3_object" "file_upload" {
	bucket = aws_s3_bucket.cssaq2_bucket.id
	key = "uploads/sample.txt"
	source = "sample.txt"
}
