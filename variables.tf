variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type (must stay free-tier eligible)"
  type        = string
  default     = "t3.micro"
}

variable "key_pair_name" {
  description = "Name of the EC2 key pair for SSH access"
  type        = string
  default     = "itam-terraform-key"
}

variable "frontend_bucket_name" {
  description = "Globally-unique S3 bucket name for the frontend static site"
  type        = string
}

variable "my_ip" {
  description = "Your local IP address (with /32 suffix) allowed to SSH into the instance"
  type        = string
}