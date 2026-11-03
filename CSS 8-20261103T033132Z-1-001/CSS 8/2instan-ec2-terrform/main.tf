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

resource "aws_instance" "my_ec21" {
	ami = "ami-0c230065b91270bc6"
	instance_type = "t2.micro"
	key_name = "aws_login1"

	tags = {
		Name = "Terraform-EC2-1"
	}
}

resource "aws_instance" "my_ec22" {
        ami = "ami-0c230065b91270bc6"
        instance_type = "t2.micro"
        key_name = "aws_login1"

        tags = {
                Name = "Terraform-EC2-2"
        }
}
