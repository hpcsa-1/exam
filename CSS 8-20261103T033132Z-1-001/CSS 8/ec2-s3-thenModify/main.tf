terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# Dynamic AMI data source for Amazon Linux 2023
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# 1. Create the S3 Bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = "smit-demo-bucket-2026-xyz" # Replace with your globally unique bucket name
}

# 2. Create the EC2 Instance (Starting with t3.micro)
resource "aws_instance" "my_server" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t3.small"

  tags = {
    Name = "DemoServer"
  }
}
