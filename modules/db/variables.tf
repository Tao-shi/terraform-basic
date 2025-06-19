variable "db_instance_type" {
  type = string
}

variable "db_username" {
  type = string
}

variable "db_password" {
  type = string
}

variable "security_group_ids" {
  type = list(string)
}