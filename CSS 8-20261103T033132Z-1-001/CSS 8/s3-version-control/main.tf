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

# 1. Create the S3 Bucket
resource "aws_s3_bucket" "versioned_bucket" {
  bucket = "my-versioned-bucket-unique-12345" # Replace with a globally unique bucket name
}

# 2. Enable Bucket Versioning
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.versioned_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}
