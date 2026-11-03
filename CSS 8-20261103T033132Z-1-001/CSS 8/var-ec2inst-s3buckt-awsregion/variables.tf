variable "aws_region" {
  type        = string
  description = "The AWS region to deploy resources into"
  default     = "us-east-1"
}

variable "instance_type" {
  type        = string
  description = "The EC2 instance sizing type"
  default     = "t3.micro"
}

variable "s3_bucket_name" {
  type        = string
  description = "Globally unique name for the S3 bucket"
  default     = "my-custom-terraform-bucket-998877"
}
