variable "ami" {
  description = "AMI ID"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "priv_key_name" {
  description = "SSH key pair"
  type        = string
}

variable "vpc_security_group_ids" {
  description = "Security Group ID to attach"
  type        = list(string)
}

variable "instance_name" {
  description = "Name of the EC2 instance"
  type        = string
}

variable "instance_count" {
  type        = number
  description = "count"
  default     = 1
}

variable "subnet_id" {
  type = string

}