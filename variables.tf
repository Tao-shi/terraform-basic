variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "db_username" {
  description = "Database username"
  type        = string
  sensitive   = true
}

variable "db_instance_type" {
  description = "Database instance type"
  type        = string
  default     = "db.t2.micro"
}

variable "db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}

variable "key_name" {

  description = "EC2 key naem"
  type        = string
}

variable "instance_name" {
  description = "EC2 instance name"
  type        = string
  default     = "drugstoc-server"
}

variable "ami_id" {
  description = "Ubuntu 22.04 ami-id"
  type        = string
  default     = "ami-04b4f1a9cf54c11d0"
}