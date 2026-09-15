variable "instance_type" {
  description = "Type of instance to create"
  type        = string
  default     = "t3.micro"
}

variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "eu-west-2"
}